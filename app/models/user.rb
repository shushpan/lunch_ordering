class User < ApplicationRecord
  before_save do
    self.email.downcase!
    self.admin = true if User.count.zero?
  end

  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  validates :email, presence: true, length: {minimum: 4}
  validates :telephone, presence: true, phone: true

  def admin?
    self.admin
  end

end
