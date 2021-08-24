class Shift < ApplicationRecord
  belongs_to :manager, class_name: "User"
  has_many :employees, through: :user_shifts, class_name: 'User'
  has_many :user_shifts
end
