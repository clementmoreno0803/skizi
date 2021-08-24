UserShift.destroy_all
Shift.destroy_all
User.destroy_all

puts 'creating users'
employee1 = User.create!(email: 'toto@gmail.com', password: 'tototo', password_confirmation: 'tototo',
                         username: 'toto toto', jobs: 'runner, padder', contract_hours_per_week: 15)
employee2 = User.create!(email: 'tata@gmail.com', password: 'tatata', password_confirmation: 'tatata',
                         username: 'tata tata', jobs: 'runner, barman', contract_hours_per_week: 20)
employee3 = User.create!(email: 'titi@gmail.com', password: 'tititi', password_confirmation: 'tititi',
                         username: 'titi titi', jobs: 'barman, padder', contract_hours_per_week: 21)
employee4 = User.create!(email: 'tutu@gmail.com', password: 'tututu', password_confirmation: 'tututu',
                         username: 'tutu tutu', jobs: 'runner', contract_hours_per_week: 12)
employee5 = User.create!(email: 'tete@gmail.com', password: 'tetete', password_confirmation: 'tetete',
                         username: 'tete tete', jobs: 'padder, barman', contract_hours_per_week: 15)
manager = User.create!(email: 'charlie@gmail.com', password: 'charlie', password_confirmation: 'charlie',
                       username: 'Charlie Morizot', jobs: 'manager', contract_hours_per_week: 90)

puts 'users created'
puts 'creating shifts'

shift1 = Shift.create!(
  started_at: "2021,09,05,18,00,00",
  ended_at: "2021,09,05,21,00,00",
  manager_id: manager.id,
  runner_needed: 2,
  padder_needed: 1,
  barman_needed: 1
)

shift2 = Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", manager_id:
                       manager.id, runner_needed: 2, padder_needed: 2, barman_needed: 1)

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

puts 'user_shifts created'
