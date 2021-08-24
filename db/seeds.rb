UserShift.destroy_all
Shift.destroy_all
User.destroy_all


user1 = User.create!(email: 'toto@gmail.com', password: 'tototo', password_confirmation: 'tototo',
                     username: 'toto toto', entity: copain)
user2 = User.create!(email: 'tata@gmail.com', password: 'tatata', password_confirmation: 'tatata',
                     username: 'tata tata', entity: copain)
user3 = User.create!(email: 'titi@gmail.com', password: 'tititi', password_confirmation: 'tititi',
                     username: 'titi titi', entity: copain)
user4 = User.create!(email: 'tutu@gmail.com', password: 'tututu', password_confirmation: 'tututu',
                     username: 'tutu tutu', entity: copain)
user5 = User.create!(email: 'tete@gmail.com', password: 'tetete', password_confirmation: 'tetete',
                     username: 'tete tete', entity: copain)
manager = User.create!(email: 'charlie@gmail.com', password: 'charlie', password_confirmation: 'charlie',
                       username: 'Charlie Morizot', entity: copain)

Shift.create!(started_at: "2021,09,05,18,00,00", ended_at: "2021,09,05,21,00,00", job: 'runner',
              status: "RAS", user: user1, entity: copain)
Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'padder',
              status: "RAS", user: user2, entity: copain)
Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'barman',
              status: "RAS", user: user1, entity: copain)
Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'runner-cuisine',
              status: "RAS", user: user2, entity: copain)
Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'barman-vaiselle',
              status: "RAS", user: user5, entity: copain)
Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'runner',
              status: "RAS", user: user4, entity: copain)
Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'runner',
              status: "RAS", user: user3, entity: copain)
Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'runner',
              status: "Reclamation", user: user4, entity: copain)
Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'runner',
              status: "RAS", user: user5, entity: copain)
Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'runner',
              status: "RAS", user: user3, entity: copain)
