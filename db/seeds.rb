# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.clean_with(:truncation)

Role.create([
  {id: 1, name: 'admin'}
])
Role.create([
  {id: 2, name: 'manager'}
])
Role.create([
  {id: 3, name: 'staff'}
])
Role.create([
  {id: 4, name: 'member'}
])
Role.create([
  {id: 5, name: 'pending'}
])
Role.create([
  {id: 6, name: 'un_finish'}
])

User.create([
  {email: 'gg@gmail.com',
   name: 'gg',
   personal_id: 'a12345678',
   password: 'ggininder'
}
])

user = User.find(1)
user.add_role "admin"
user.save
