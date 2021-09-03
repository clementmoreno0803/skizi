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

bruno = User.create!(email: 'bruno@gmail.com', password: 'bruno1', password_confirmation: 'bruno1',
                     username: 'Bruno Latourelle', contract_hours_per_week: 10)
martine = User.create!(email: 'martine@gmail.com', password: 'martine', password_confirmation: 'martine',
                       username: 'Martine Charbonneau', contract_hours_per_week: 15)
elodie = User.create!(email: 'elodie@gmail.com', password: 'elodie', password_confirmation: 'elodie',
                      username: 'Elodie Therriault', contract_hours_per_week: 7)
julien = User.create!(email: 'julien@gmail.com', password: 'julien', password_confirmation: 'julien',
                      username: 'Julien Blanc', contract_hours_per_week: 12)
marie = User.create!(email: 'marie@gmail.com', password: 'marie1', password_confirmation: 'marie1',
                     username: 'Marie Etoile', contract_hours_per_week: 10)
michael = User.create!(email: "michael@gmail.com", password: 'michael', password_confirmation:
                      'michael', username: 'Michael Grosheny', contract_hours_per_week: 0, status: "Off")
nathan = User.create!(email: "nathan@gmail.com", password: 'nathan', password_confirmation:
                      'nathan', username: 'Nathan Berthier', contract_hours_per_week: 800)
charlie = User.create!(email: 'charlie@gmail.com', password: 'charlie', password_confirmation:
                       'charlie', username: 'Charlie Morizot', contract_hours_per_week: 0, status: 'Off')
clement = User.create!(email: 'clement@gmail.com', password: 'clement', password_confirmation:
                       'clement', username: 'Clement Moreno', contract_hours_per_week: 0)
nicolas = User.create!(email: 'nicolas@gmail.com', password: 'nicolas', password_confirmation:
                       'nicolas', username: 'Nicolas Feuerstein', contract_hours_per_week: 10)
leo = User.create!(email: 'leo@gmail.com', password: 'leoleo', password_confirmation:
                   'leoleo', username: 'Leo Genuit', contract_hours_per_week: 20)
simon = User.create!(email: 'simon@gmail.com', password: 'simon1', password_confirmation:
                     'simon1', username: 'Simon Granger', contract_hours_per_week: 8)

puts 'users created'
puts 'creating user_jobs'

UserJob.create!(user: bruno, job: runner)
UserJob.create!(user: bruno, job: padder)

UserJob.create!(user: martine, job: runner)
UserJob.create!(user: martine, job: padder)

UserJob.create!(user: elodie, job: barman)

UserJob.create!(user: julien, job: runner)
UserJob.create!(user: julien, job: padder)
UserJob.create!(user: julien, job: barman)

UserJob.create!(user: marie, job: padder)
UserJob.create!(user: marie, job: barman)

UserJob.create!(user: michael, job: runner)
UserJob.create!(user: michael, job: manager)

UserJob.create!(user: nathan, job: padder)
UserJob.create!(user: nathan, job: runner)
UserJob.create!(user: nathan, job: barman)

UserJob.create!(user: charlie, job: manager)

UserJob.create!(user: clement, job: manager)

UserJob.create!(user: nicolas, job: barman)

UserJob.create!(user: leo, job: runner)
UserJob.create!(user: leo, job: padder)

UserJob.create!(user: simon, job: runner)
UserJob.create!(user: simon, job: barman)

puts 'user_jobs created'

shiftm2 = Shift.create!(
  started_at: "30/08/2021 18:00",
  ended_at: "30/08/2021 21:00",
  manager_id: charlie.id
)

shiftm1 = Shift.create!(
  started_at: "31/08/2021 18:00",
  ended_at: "31/08/2021 21:00",
  manager_id: charlie.id
)

shift1 = Shift.create!(
  started_at: "01/09/2021 18:00",
  ended_at: "01/09/2021 21:00",
  manager_id: charlie.id
)

shift2 = Shift.create!(
  started_at: "02/09/2021 18:00",
  ended_at: "02/09/2021 21:00",
  manager_id: charlie.id
)

shift3 = Shift.create!(
  started_at: "04/09/2021 18:00",
  ended_at: "04/09/2021 21:00",
  manager_id: charlie.id
)

shift4 = Shift.create!(
  started_at: "06/09/2021 18:00",
  ended_at: "06/09/2021 21:00",
  manager_id: charlie.id
)

shift5 = Shift.create!(
  started_at: "07/09/2021 18:00",
  ended_at: "07/09/2021 21:00",
  manager_id: charlie.id
)

shift6 = Shift.create!(
  started_at: "08/09/2021 18:00",
  ended_at: "08/09/2021 21:00",
  manager_id: charlie.id
)
shift7 = Shift.create!(
  started_at: "09/09/2021 18:00",
  ended_at: "09/09/2021 21:00",
  manager_id: charlie.id
)
shift8 = Shift.create!(
  started_at: "10/09/2021 18:00",
  ended_at: "10/09/2021 21:00",
  manager_id: charlie.id
)
shift9 = Shift.create!(
  started_at: "11/09/2021 18:00",
  ended_at: "11/09/2021 21:00",
  manager_id: charlie.id
)
shift10 = Shift.create!(
  started_at: "13/09/2021 18:00",
  ended_at: "13/09/2021 21:00",
  manager_id: charlie.id
)
shift11 = Shift.create!(
  started_at: "14/09/2021 18:00",
  ended_at: "14/09/2021 21:00",
  manager_id: charlie.id
)
shift12 = Shift.create!(
  started_at: "15/09/2021 18:00",
  ended_at: "15/09/2021 21:00",
  manager_id: charlie.id
)
shift13 = Shift.create!(
  started_at: "16/09/2021 18:00",
  ended_at: "16/09/2021 21:00",
  manager_id: charlie.id
)
shift14 = Shift.create!(
  started_at: "17/09/2021 18:00",
  ended_at: "17/09/2021 21:00",
  manager_id: charlie.id
)
shift15 = Shift.create!(
  started_at: "18/09/2021 18:00",
  ended_at: "18/09/2021 21:00",
  manager_id: charlie.id
)
shift16 = Shift.create!(
  started_at: "20/09/2021 18:00",
  ended_at: "20/09/2021 21:00",
  manager_id: charlie.id
)
shift17 = Shift.create!(
  started_at: "21/09/2021 18:00",
  ended_at: "21/09/2021 21:00",
  manager_id: charlie.id
)
shift18 = Shift.create!(
  started_at: "22/09/2021 18:00",
  ended_at: "22/09/2021 21:00",
  manager_id: charlie.id
)
shift19 = Shift.create!(
  started_at: "23/09/2021 18:00",
  ended_at: "23/09/2021 21:00",
  manager_id: charlie.id
)
shift20 = Shift.create!(
  started_at: "24/09/2021 18:00",
  ended_at: "24/09/2021 21:00",
  manager_id: charlie.id
)
shift21 = Shift.create!(
  started_at: "25/09/2021 18:00",
  ended_at: "25/09/2021 21:00",
  manager_id: clement.id
)
shift22 = Shift.create!(
  started_at: "27/09/2021 18:00",
  ended_at: "27/09/2021 21:00",
  manager_id: clement.id
)
shift23 = Shift.create!(
  started_at: "28/09/2021 18:00",
  ended_at: "28/09/2021 21:00",
  manager_id: clement.id
)
shift24 = Shift.create!(
  started_at: "29/09/2021 18:00",
  ended_at: "29/09/2021 21:00",
  manager_id: clement.id
)
shift25 = Shift.create!(
  started_at: "30/09/2021 18:00",
  ended_at: "30/09/2021 21:00",
  manager_id: clement.id
)
shiftp1 = Shift.create!(
  started_at: "01/10/2021 18:00",
  ended_at: "01/10/2021 21:00",
  manager_id: clement.id
)
shiftp2 = Shift.create!(
  started_at: "02/10/2021 18:00",
  ended_at: "02/10/2021 21:00",
  manager_id: clement.id
)
shiftp3 = Shift.create!(
  started_at: "04/10/2021 18:00",
  ended_at: "04/10/2021 21:00",
  manager_id: clement.id
)
shiftp4 = Shift.create!(
  started_at: "05/10/2021 18:00",
  ended_at: "05/10/2021 21:00",
  manager_id: clement.id
)
shiftp5 = Shift.create!(
  started_at: "06/10/2021 18:00",
  ended_at: "06/10/2021 21:00",
  manager_id: clement.id
)
shiftp6 = Shift.create!(
  started_at: "07/10/2021 18:00",
  ended_at: "07/10/2021 21:00",
  manager_id: clement.id
)
shiftp7 = Shift.create!(
  started_at: "08/10/2021 18:00",
  ended_at: "08/10/2021 21:00",
  manager_id: clement.id
)
shiftp8 = Shift.create!(
  started_at: "09/10/2021 18:00",
  ended_at: "09/10/2021 21:00",
  manager_id: clement.id
)
shiftdemo = Shift.create!(
  started_at: "03/09/2021 18:00",
  ended_at: "03/09/2021 21:00",
  manager_id: clement.id
)

puts 'shifts created'
puts 'creating user_shifts'

UserShift.create!(shift: shiftm2, employee: bruno, job: 'runner')
UserShift.create!(shift: shiftm2, employee: julien, job: 'runner')
UserShift.create!(shift: shiftm2, employee: martine, job: 'padder')
UserShift.create!(shift: shiftm2, employee: marie, job: 'barman')

UserShift.create!(shift: shiftm1, employee: nathan, job: 'runner')
UserShift.create!(shift: shiftm1, employee: julien, job: 'runner')
UserShift.create!(shift: shiftm1, employee: martine, job: 'padder')
UserShift.create!(shift: shiftm1, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift1, employee: bruno, job: 'runner')
UserShift.create!(shift: shift1, employee: nathan, job: 'runner')
UserShift.create!(shift: shift1, employee: martine, job: 'padder')
UserShift.create!(shift: shift1, employee: simon, job: 'barman')

UserShift.create!(shift: shift2, employee: martine, job: 'runner')
UserShift.create!(shift: shift2, employee: julien, job: 'padder')
UserShift.create!(shift: shift2, employee: marie, job: 'padder')
UserShift.create!(shift: shift2, employee: elodie, job: 'barman')

UserShift.create!(shift: shift3, employee: bruno, job: 'runner')
UserShift.create!(shift: shift3, employee: nathan, job: 'runner')
UserShift.create!(shift: shift3, employee: martine, job: 'padder')
UserShift.create!(shift: shift3, employee: marie, job: 'barman')
UserShift.create!(shift: shift3, employee: leo, job: 'padder')

UserShift.create!(shift: shift4, employee: bruno, job: 'runner')
UserShift.create!(shift: shift4, employee: julien, job: 'padder')
UserShift.create!(shift: shift4, employee: leo, job: 'padder')
UserShift.create!(shift: shift4, employee: nathan, job: 'barman')

UserShift.create!(shift: shift5, employee: leo, job: 'runner')
UserShift.create!(shift: shift5, employee: martine, job: 'padder')
UserShift.create!(shift: shift5, employee: nathan, job: 'padder')
UserShift.create!(shift: shift5, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift6, employee: nathan, job: 'runner')
UserShift.create!(shift: shift6, employee: leo, job: 'padder')
UserShift.create!(shift: shift6, employee: julien, job: 'padder')
UserShift.create!(shift: shift6, employee: elodie, job: 'barman')

UserShift.create!(shift: shift7, employee: simon, job: 'runner')
UserShift.create!(shift: shift7, employee: leo, job: 'padder')
UserShift.create!(shift: shift7, employee: nathan, job: 'padder')
UserShift.create!(shift: shift7, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift8, employee: julien, job: 'runner')
UserShift.create!(shift: shift8, employee: leo, job: 'runner')
UserShift.create!(shift: shift8, employee: martine, job: 'padder')
UserShift.create!(shift: shift8, employee: nathan, job: 'padder')
UserShift.create!(shift: shift8, employee: elodie, job: 'barman')

UserShift.create!(shift: shift9, employee: julien, job: 'runner')
UserShift.create!(shift: shift9, employee: simon, job: 'runner')
UserShift.create!(shift: shift9, employee: leo, job: 'padder')
UserShift.create!(shift: shift9, employee: nathan, job: 'padder')
UserShift.create!(shift: shift9, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift10, employee: leo, job: 'runner')
UserShift.create!(shift: shift10, employee: julien, job: 'padder')
UserShift.create!(shift: shift10, employee: nathan, job: 'padder')
UserShift.create!(shift: shift10, employee: simon, job: 'barman')

UserShift.create!(shift: shift11, employee: simon, job: 'runner')
UserShift.create!(shift: shift11, employee: julien, job: 'padder')
UserShift.create!(shift: shift11, employee: leo, job: 'padder')
UserShift.create!(shift: shift11, employee: nathan, job: 'barman')

UserShift.create!(shift: shift12, employee: michael, job: 'runner')
UserShift.create!(shift: shift12, employee: nathan, job: 'padder')
UserShift.create!(shift: shift12, employee: leo, job: 'padder')
UserShift.create!(shift: shift12, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift13, employee: leo, job: 'runner')
UserShift.create!(shift: shift13, employee: martine, job: 'padder')
UserShift.create!(shift: shift13, employee: julien, job: 'padder')
UserShift.create!(shift: shift13, employee: simon, job: 'barman')

UserShift.create!(shift: shift14, employee: simon, job: 'runner')
UserShift.create!(shift: shift14, employee: leo, job: 'runner')
UserShift.create!(shift: shift14, employee: martine, job: 'padder')
UserShift.create!(shift: shift14, employee: marie, job: 'padder')
UserShift.create!(shift: shift14, employee: elodie, job: 'barman')

UserShift.create!(shift: shift15, employee: leo, job: 'runner')
UserShift.create!(shift: shift15, employee: simon, job: 'runner')
UserShift.create!(shift: shift15, employee: nathan, job: 'padder')
UserShift.create!(shift: shift15, employee: marie, job: 'padder')
UserShift.create!(shift: shift15, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift16, employee: leo, job: 'runner')
UserShift.create!(shift: shift16, employee: julien, job: 'padder')
UserShift.create!(shift: shift16, employee: marie, job: 'padder')
UserShift.create!(shift: shift16, employee: nathan, job: 'barman')

UserShift.create!(shift: shift17, employee: leo, job: 'runner')
UserShift.create!(shift: shift17, employee: nathan, job: 'padder')
UserShift.create!(shift: shift17, employee: martine, job: 'padder')
UserShift.create!(shift: shift17, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift18, employee: leo, job: 'runner')
UserShift.create!(shift: shift18, employee: nathan, job: 'padder')
UserShift.create!(shift: shift18, employee: martine, job: 'padder')
UserShift.create!(shift: shift18, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift19, employee: julien, job: 'runner')
UserShift.create!(shift: shift19, employee: nathan, job: 'padder')
UserShift.create!(shift: shift19, employee: marie, job: 'padder')
UserShift.create!(shift: shift19, employee: simon, job: 'barman')

UserShift.create!(shift: shift20, employee: julien, job: 'runner')
UserShift.create!(shift: shift20, employee: leo, job: 'runner')
UserShift.create!(shift: shift20, employee: nathan, job: 'padder')
UserShift.create!(shift: shift20, employee: simon, job: 'padder')
UserShift.create!(shift: shift20, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift21, employee: bruno, job: 'runner')
UserShift.create!(shift: shift21, employee: leo, job: 'runner')
UserShift.create!(shift: shift21, employee: nathan, job: 'padder')
UserShift.create!(shift: shift21, employee: marie, job: 'padder')
UserShift.create!(shift: shift21, employee: nicolas, job: 'barman')

UserShift.create!(shift: shift22, employee: julien, job: 'runner')
UserShift.create!(shift: shift22, employee: nathan, job: 'padder')
UserShift.create!(shift: shift22, employee: bruno, job: 'padder')
UserShift.create!(shift: shift22, employee: elodie, job: 'barman')

UserShift.create!(shift: shift23, employee: leo, job: 'runner')
UserShift.create!(shift: shift23, employee: martine, job: 'padder')
UserShift.create!(shift: shift23, employee: nathan, job: 'padder')
UserShift.create!(shift: shift23, employee: simon, job: 'barman')

UserShift.create!(shift: shift24, employee: martine, job: 'runner')
UserShift.create!(shift: shift24, employee: bruno, job: 'padder')
UserShift.create!(shift: shift24, employee: leo, job: 'padder')
UserShift.create!(shift: shift24, employee: nathan, job: 'barman')

UserShift.create!(shift: shift25, employee: bruno, job: 'runner')
UserShift.create!(shift: shift25, employee: leo, job: 'padder')
UserShift.create!(shift: shift25, employee: nathan, job: 'padder')
UserShift.create!(shift: shift25, employee: simon, job: 'barman')

UserShift.create!(shift: shiftp1, employee: martine, job: 'runner')
UserShift.create!(shift: shiftp1, employee: bruno, job: 'runner')
UserShift.create!(shift: shiftp1, employee: leo, job: 'padder')
UserShift.create!(shift: shiftp1, employee: nathan, job: 'padder')
UserShift.create!(shift: shiftp1, employee: elodie, job: 'barman')

UserShift.create!(shift: shiftp2, employee: nathan, job: 'runner')
UserShift.create!(shift: shiftp2, employee: simon, job: 'runner')
UserShift.create!(shift: shiftp2, employee: leo, job: 'padder')
UserShift.create!(shift: shiftp2, employee: marie, job: 'padder')
UserShift.create!(shift: shiftp2, employee: nicolas, job: 'barman')

UserShift.create!(shift: shiftp3, employee: nathan, job: 'runner')
UserShift.create!(shift: shiftp3, employee: leo, job: 'padder')
UserShift.create!(shift: shiftp3, employee: marie, job: 'padder')
UserShift.create!(shift: shiftp3, employee: simon, job: 'barman')

UserShift.create!(shift: shiftp4, employee: bruno, job: 'runner')
UserShift.create!(shift: shiftp4, employee: leo, job: 'padder')
UserShift.create!(shift: shiftp4, employee: marie, job: 'padder')
UserShift.create!(shift: shiftp4, employee: simon, job: 'barman')

UserShift.create!(shift: shiftp5, employee: nathan, job: 'runner')
UserShift.create!(shift: shiftp5, employee: leo, job: 'padder')
UserShift.create!(shift: shiftp5, employee: marie, job: 'padder')
UserShift.create!(shift: shiftp5, employee: elodie, job: 'barman')

UserShift.create!(shift: shiftp6, employee: nathan, job: 'runner')
UserShift.create!(shift: shiftp6, employee: leo, job: 'padder')
UserShift.create!(shift: shiftp6, employee: marie, job: 'padder')
UserShift.create!(shift: shiftp6, employee: simon, job: 'barman')

UserShift.create!(shift: shiftp7, employee: nathan, job: 'runner')
UserShift.create!(shift: shiftp7, employee: marie, job: 'runner')
UserShift.create!(shift: shiftp7, employee: leo, job: 'padder')
UserShift.create!(shift: shiftp7, employee: martine, job: 'padder')
UserShift.create!(shift: shiftp7, employee: nicolas, job: 'barman')

UserShift.create!(shift: shiftp8, employee: nathan, job: 'runner')
UserShift.create!(shift: shiftp8, employee: marie, job: 'runner')
UserShift.create!(shift: shiftp8, employee: leo, job: 'padder')
UserShift.create!(shift: shiftp8, employee: elodie, job: 'padder')
UserShift.create!(shift: shiftp8, employee: nicolas, job: 'barman')

puts 'user_shifts created'
puts 'Seeds done'
