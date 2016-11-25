# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.all.each { |c| c.delete }
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
Category.create(name: 'Administrative')
Category.create(name: 'Brand Ambassador')
Category.create(name: 'Customer Service')
Category.create(name: 'Data Entry')
Category.create(name: 'Delivery')
Category.create(name: 'Event Staff')
Category.create(name: 'Fulfillment / Warehousing')
Category.create(name: 'General Labor')
Category.create(name: 'Market Research')
Category.create(name: 'Marketing')
Category.create(name: 'Merchandising')
Category.create(name: 'Sales')
Category.create(name: 'Software Testing')
Category.create(name: 'Volunteer')
Category.create(name: 'Washing & Cleaning')
Category.create(name: 'Other')