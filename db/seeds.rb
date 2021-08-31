UserJob.destroy_all
Job.destroy_all
UserShift.destroy_all
Shift.destroy_all
User.destroy_all

puts 'creating jobs'

runner = Job.create!(job: 'Runner')
padder = Job.create!(job: 'Padder')
barman = Job.create!(job: 'Barman')
manager = Job.create!(job: 'Manager')

puts 'jobs created'
puts 'creating users'

employee1 = User.create!(email: 'bruno@gmail.com', password: 'bruno', password_confirmation: 'bruno',
                         username: 'Bruno Latourelle', contract_hours_per_week: 15)
employee2 = User.create!(email: 'martine@gmail.com', password: 'martine', password_confirmation: 'martine',
                         username: 'Martine Charbonneau', contract_hours_per_week: 20)
employee3 = User.create!(email: 'titi@gmail.com', password: 'tititi', password_confirmation: 'tititi',
                         username: 'titi titi', contract_hours_per_week: 21)
employee4 = User.create!(email: 'tutu@gmail.com', password: 'tututu', password_confirmation: 'tututu',
                         username: 'tutu tutu', contract_hours_per_week: 12)
employee5 = User.create!(email: 'tete@gmail.com', password: 'tetete', password_confirmation: 'tetete',
                         username: 'tete tete', contract_hours_per_week: 15)
employee6 = User.create!(email: "michael@gmail.com", password: 'michael', password_confirmation:
                        'michael', username: 'Michael Grosheny', contract_hours_per_week: 78, status: "Off")
nathan = User.create!(email: "nathan@gmail.com", password: 'nathan', password_confirmation:
                        'nathan', username: 'Nathan Berthier', contract_hours_per_week: 800, status: "Ongoing")
user_manager = User.create!(email: 'charlie@gmail.com', password: 'charlie', password_confirmation:
                            'charlie', username: 'Charlie Morizot', contract_hours_per_week: 90)

puts 'users created'
puts 'creating user_jobs'

UserJob.create!(user: employee1, job: runner)
UserJob.create!(user: employee1, job: padder)
UserJob.create!(user: employee2, job: runner)
UserJob.create!(user: employee2, job: padder)
UserJob.create!(user: employee3, job: barman)
UserJob.create!(user: employee4, job: runner)
UserJob.create!(user: employee4, job: padder)
UserJob.create!(user: employee4, job: barman)
UserJob.create!(user: employee5, job: padder)
UserJob.create!(user: employee5, job: barman)
UserJob.create!(user: employee6, job: runner)
UserJob.create!(user: employee6, job: manager)
UserJob.create!(user: nathan, job: padder)
UserJob.create!(user: nathan, job: runner)
UserJob.create!(user: nathan, job: barman)
UserJob.create!(user: user_manager, job: manager)

puts 'user_jobs created'
puts 'creating shifts'

shift1 = Shift.create!(
  started_at: "03/09/2021 18:00",
  ended_at: "03/09/2021 21:00",
  manager_id: user_manager.id
)

shift2 = Shift.create!(
  started_at: "05/09/2021 18:00",
  ended_at: "05/09/2021 21:00",
  manager_id: user_manager.id
)

shift3 = Shift.create!(
  started_at: "06/09/2021 18:00",
  ended_at: "06/09/2021 21:00",
  manager_id: user_manager.id
)

puts 'shifts created'
puts 'creating user_shifts'

UserShift.create!(shift: shift1, employee: employee1, job: 'runner')
UserShift.create!(shift: shift1, employee: employee4, job: 'runner')
UserShift.create!(shift: shift1, employee: employee2, job: 'padder')
UserShift.create!(shift: shift1, employee: employee5, job: 'barman')

UserShift.create!(shift: shift2, employee: employee2, job: 'runner')
UserShift.create!(shift: shift2, employee: employee1, job: 'runner')
UserShift.create!(shift: shift2, employee: employee4, job: 'padder')
UserShift.create!(shift: shift2, employee: employee5, job: 'padder')
UserShift.create!(shift: shift2, employee: employee3, job: 'barman')

UserShift.create!(shift: shift3, employee: employee1, job: 'runner')
UserShift.create!(shift: shift3, employee: employee2, job: 'padder')
UserShift.create!(shift: shift3, employee: employee5, job: 'barman')

puts 'user_shifts created'
