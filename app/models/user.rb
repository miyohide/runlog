class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  belongs_to :role

  def ability
    Ability.ability_hash self.role.roles_abilities.map(&:ability_id)
  end

  def admin?
    ability.include? "admin"
  end

  scope :except_admin, -> {
    joins(:role).where.not(roles: { name: "administrator"} )
  }
end

