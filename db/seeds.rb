# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

APIKEY = ENV['APIKEY']

# Startups
companies_base_url = "https://api.mattermark.com/companies?&per_page=10&page=1&key=#{APIKEY}"
result = JSON.parse(open(companies_base_url).read)
result['companies'].each do |company|
  name = company['company_name']
  url = company['domain']
  description = Faker::Company.catch_phrase
  industry = Faker::Company.industry
  role = "startup"
  user = User.new(name: name, url: url, description: description, industry: industry, role: role)
  user.email = Faker::Internet.email
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'

  file = URI.open('https://res.cloudinary.com/doewieec6/image/upload/v1598440482/belydzaow0mz6nxbqfztx7p7a4lw.jpg')
  user.photo.attach(io: file, filename: 'belydzaow0mz6nxbqfztx7p7a4lw.jpg', content_type: 'image/jpg')

  user.save
  rand(0..2).times do
    FundingRound.create(name: ["Seed", "Series A", "Series B"].sample(), amount: rand(100000..10000000), user: user)
  end
end
user = User.new(name: "Climately", url: "climately.io", description: "The most awesome climate change game in the world. Visionary founders with a clear vision on how saving the world can be fun.", industry: "Sustainability", role: "startup")
user.email = "celine@climately.io"
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save

# Investors 
id = 30

5.times do 
investors_base_url = "https://api.mattermark.com/investors/#{id}?key=#{APIKEY}"
result = JSON.parse(open(investors_base_url).read)
  name = result['name']
  url = result['website']
  description = Faker::Company.catch_phrase
  industry = Faker::Company.industry
  role = "investor"
user = User.new(name: name, url: url, description: description, industry: industry, role: role)
  user.email = Faker::Internet.email
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  file = URI.open('https://res.cloudinary.com/doewieec6/image/upload/v1598368425/76mfzslakddp7nj14jzvhw2vpg8z.jpg')
  user.photo.attach(io: file, filename: '76mfzslakddp7nj14jzvhw2vpg8z.jpg', content_type: 'image/jpg')
user.save
id += 1
end