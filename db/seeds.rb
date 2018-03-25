# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD'],
  role: 'admin'
)

school = School.create(
  name: 'Norgate'
)

User.create(
  email: ENV['COORDINATOR_EMAIL'],
  password: ENV['COORDINATOR_PASSWORD'],
  password_confirmation: ENV['COORDINATOR_PASSWORD'],
  role: 'coordinator',
  school_id: school.id
)

User.create(
  email: ENV['PARENT_EMAIL'],
  password: ENV['PARENT_PASSWORD'],
  password_confirmation: ENV['PARENT_PASSWORD'],
  school_id: school.id
)