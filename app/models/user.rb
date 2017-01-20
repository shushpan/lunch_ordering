class User < ApplicationRecord
  before_save do
    self.admin = true if User.count.zero?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: {minimum: 2}
  validates :email, presence: true, length: {minimum: 4}

end
