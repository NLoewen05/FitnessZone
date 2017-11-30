# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

provinces = ['Alberta', 'British Columbia', 'Manitoba',
             'New Brunswick', 'Newfoundland and Labrador', 'Nova Scotia',
             'Ontario', 'Prince Edward Island', 'Quebec', 'Saskatchewan']

provinces.each { |p| Province.create!(:name => p) }

# product_categories = ['Pre Workout', 'Protein', 'BCAAs', 'Vitamins' ]

# product_categories.each { |p| ProductCategory.create!(:name => p)}

address_types = ['Shipping', 'Billing']

address_types.each {|a| AddressType.create!(:name => a)}
