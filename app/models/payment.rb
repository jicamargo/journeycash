class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :label, presence: true
  validates :group, presence: true
  
  belongs_to :label
  belongs_to :group
end
