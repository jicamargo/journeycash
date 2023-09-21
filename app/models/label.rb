class Label < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy
end
