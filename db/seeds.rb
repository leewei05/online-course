# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ name: 'Lee', admin: true, password: '123456', email: 'admin@gmail.com'}, { name: 'John', admin: false, password: '123456', email: 'user@gmail.com'}])

Course.create([
    { name: 'English', theme: 'English Speaking', price: 99.99, currency: 'USD', course_type: 'Literature', on_shelf: true, description: 'English', expire_time: 30},
    { name: 'Manadarin', theme: 'Manadarin Speaking', price: 10.99, currency: 'USD', course_type: 'Literature', on_shelf: true, description: 'Chinese', expire_time: 10},
    { name: 'Physics', theme: 'Physics', price: 199.99, currency: 'USD', course_type: 'Science', on_shelf: false, description: 'Physics', expire_time: 1},
    { name: 'GCP 101', theme: 'GCP', price: 1990, currency: 'USD', course_type: 'Computer Science', on_shelf: true, description: 'GCP', expire_time: 100}
])