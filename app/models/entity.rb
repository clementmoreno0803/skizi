class Entity < ApplicationRecord
  has_many :shifts
  has_many :users
end
