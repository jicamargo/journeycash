class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups 
  has_many :labels
  has_many :payments, through: :groups

  validates :name, presence: true, length: { maximum: 50, minimum: 1 }
end
