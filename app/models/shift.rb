class Shift < ApplicationRecord
  belongs_to :entity
  belongs_to :user, optionnal: true
end
