class Ability < ActiveRecord::Base
  # domainは、操作対象のモデル名。
  # abilityは、操作対象のcontrollerのaction名
  # admin権限においては、domain, abilityともに"admin"が入っている。
  has_many :roles_abilityes
  has_many :roles, through: :roles_abilities

  # @param [Integer/Array] AbilityのID。ArrayでAbility IDの配列を与えることもできる
  # @param [Hash] 戻り値。デフォルトは空Hash
  # @return [Hash] { domain名 => [ ability名1, ability名2, ... ] } を返す
  def self.ability_hash(ability_ids, result = {})
    self.group_by_domain(ability_ids).each do |domain, abilities|
      result[domain] = abilities.map { |item| item.ability }
    end

    result
  end

  # @param [Integer/Array] AbilityのID。ArrayでAbility IDの配列を与えることもできる
  # @param [Hash] 戻り値。デフォルトは空Hash
  # @return [Hash] { domain名 => [ { ability名 => ability_id } ] } を返す
  def self.ability_hash_with_id(ability_ids, result = {})
    self.group_by_domain(ability_ids).each do |domain, abilities|
      result[domain] = abilities.map { |item| { item.ability => item.id } }
    end

    result
  end

  scope :except_admin, -> {
    where.not(abilities: { domain: "admin", ability: "admin" })
  }

  scope :group_by_domain, ->(ability_ids) {
    where(id: ability_ids).group_by(&:domain)
  }
end

