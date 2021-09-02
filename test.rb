ap "je suis l"


ap Shift.destroy_all

user = User.find_by(email: 'charlie@gmail.com')


100.times do |i|
  started_at = Date.today + 18.hours + i.days
  ended_at = Date.today + 21.hours + i.days

  Shift.create!(started_at: started_at, ended_at: ended_at, manager_id: user.id) if started_at.wday != 0
end
