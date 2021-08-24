class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shifts, through: :user_shifts
  JOBS = ['Runner', 'Padder', 'Barman', 'Manager']
  validates :jobs, inclusion: { in: JOBS }, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :contract_hours_per_week, presence: true
end
