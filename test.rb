ap "je suis l"


ap Job.all

UserJob.destroy_all
u = User.find(150)

u.update!(user_jobs_attributes: [{job_id: 62}, {job_id: 63}])
u.update!(user_jobs_attributes: [{job_id: 64}, {job_id: 63}])


ap u.jobs
