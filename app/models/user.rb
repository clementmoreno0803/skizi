class User < ApplicationRecord
  STATUS = ['Ongoing', 'Off']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable

  has_many :shifts, through: :user_shifts
  has_many :user_shifts, foreign_key: 'employee_id'
  has_many :shifts, foreign_key: 'manager_id'
  has_many :reclamations, foreign_key: 'employee_id'
  has_many :user_jobs, dependent: :destroy
  has_many :jobs, through: :user_jobs

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :contract_hours_per_week, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
end
