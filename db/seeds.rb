Shift.destroy_all
User.destroy_all
Entity.destroy_all

entity = Entity.create!(name: 'Le complexe du rire')

user1 = User.create!(email: 'toto@gmail.com', password: 'tototo', password_confirmation: 'tototo', username: 'toto', entity_id: entity.id)

Shift.create!(started_at: "2021,09,03,18,00,00", ended_at: "2021,09,03,21,00,00", job: 'runner', status: "Reclamation", user_id: user1.id, entity_id: entity.id)
