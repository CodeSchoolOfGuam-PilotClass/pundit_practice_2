class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[user admin] }

  has_many :products
  
  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end
end
