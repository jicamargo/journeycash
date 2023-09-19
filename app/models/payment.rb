class Payment < ApplicationRecord
  belongs_to :label
  belongs_to :group
end
