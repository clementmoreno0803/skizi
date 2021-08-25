class Shift < ApplicationRecord
  belongs_to :manager, class_name: "User"
  has_many :user_shifts
  has_many :employees, through: :user_shifts, class_name: 'User', foreign_key: 'employee_id'
end
