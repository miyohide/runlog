class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true


  has_many :runrecords
  belongs_to :role

  # Virtual Attribute。画面のチェックを行う
  attr_writer :admin_ability

  before_validation :ability_set

  def ability
    Ability.ability_hash self.role.roles_abilities.map(&:ability_id)
  end

  def admin?
    ability.include? "admin"
  end

  def admin_ability
    if self.new_record?
      false
    else
      self.admin?
    end
  end

  scope :except_admin, -> {
    joins(:role).where.not(roles: { name: "administrator"} )
  }

  def ability_set
    if @admin_ability
      self.role_id = Role.where(name: "administrator").first.id
    else
      self.role_id = Role.where(name: "Runrecord権限").first.id
    end
  end
end

