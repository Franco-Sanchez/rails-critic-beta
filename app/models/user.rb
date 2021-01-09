class User < ApplicationRecord
  enum role: { visitor: 'visitor', member: 'member', admin: 'admin' }
  has_many :critics, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :username, :email, presence: true, uniqueness: true
end
