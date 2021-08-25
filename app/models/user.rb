class User < ApplicationRecord
  JOBS = ['Runner', 'Padder', 'Barman', 'Manager']
  STATUS = ['Ongoing', 'Off']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable
  has_many :shifts, through: :user_shifts
  validates :jobs, inclusion: { in: JOBS }, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :contract_hours_per_week, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
end
