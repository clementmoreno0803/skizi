class Reclamation < ApplicationRecord
  belongs_to :employee, class_name: "User"
  belongs_to :shift
end
