# Roleは、複数のAbilityを束ねて1つにしたもの。
# ユーザはRoleを一つしか持てない。
class Role < ActiveRecord::Base
  has_one :user
  has_many :roles_abilities, dependent: :destroy
  has_many :abilities, through: :roles_abilities
  accepts_nested_attributes_for :roles_abilities, update_only: true

  validates_each :ability do |record, attr, value|
    if record.roles_abilities.blank?
      record.errors.add attr, "please select 1 or more of the authority."
    end
  end

  # roleが持つすべてのabilityをHash化したもの。
  # @return [Hash] { ドメイン名 => [{ability name 1 => ability id 1}, {ability name 2 => ability id 2}, ...... ] }を返す
  def ability
    Ability.ability_hash_with_id self.roles_abilities.map(&:ability_id)
  end

  # roleが持つすべてのabilityのidをArray化したもの。
  # @return [Array] roleが持つすべてのabilityのidをArray化したもの。
  def ability_id_to_a
    roles_abilities.map(&:ability_id)
  end

  # roleが持つすべてのabilityをidをキーに、abilityを値にしたHashを返す。
  # [return [Hash] roleが持つすべてのabilityをidをキーに、abilityを値にしたHashを返す。
  def index_by_ability_id
    roles_abilities.index_by(&:ability_id)
  end

  def destroy_and_update(attrs)
    ActiveRecord::Base.transaction do
      destroy_old_abilities(attrs)
      raise ActiveRecord::Rollback unless update(push_current_roles_abilities_id attrs)
      reload
      true
    end
  rescue => e
    logger.error e.message
    e.backtrace.each { |line| logger.error line }
    false
  end

  def push_current_roles_abilities_id(attrs)
    attrs["roles_abilities_attributes"].each do |item|
      if index_by_ability_id.include? item["ability_id"].to_i
        item["id"] = index_by_ability_id[item["ability_id"].to_i].id.to_s
      end
    end

    attrs
  end

  def destroy_old_abilities(attrs)
    destroy_id = get_destroy_id(attrs)

    unless destroy_id.blank?
      RolesAbility.where(role_id: id).where(ability_id: destroy_id).delete_all
    end
  end

  def get_destroy_id(attrs)
    ability_id_to_a - attrs_to_array(attrs)
  end

  scope :except_admin, -> {
    select(:id, :name).joins(:roles_abilities).joins(:abilities).where.not(abilities: { domain: "admin" }).uniq
  }

  private

  def attrs_to_array(attrs)
    raise ArgumentError if attrs_is_invalid?(attrs)
    attrs["roles_abilities_attributes"].map { |item| item["ability_id"].to_i }
  rescue ArgumentError
    errors.add "Ability", "please select 1 or more of the authority."
    raise ActiveRecord::Rollback
  end

  def attrs_is_invalid?(attrs)
    !attrs.include?("roles_abilities_attributes") or attrs["roles_abilities_attributes"].blank?
  end
end

