class Job < ApplicationRecord
  has_many :users, through: :user_jobs
  has_many :user_jobs

  JOBS = ['Runner', 'Padder', 'Barman', 'Manager']
  validates :job, inclusion: { in: JOBS }
end
