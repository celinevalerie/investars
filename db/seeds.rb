# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Mattermark API (do not do any unnecessary calls, limit of 100 calls with free plan)
=begin
require 'json'
require 'open-uri'


COMPANIES_BASEURL = "https://api.mattermark.com/companies?&per_page=20&page=1&key=#{APIKEY}"
INVESTORS_BASEURL = "https://api.mattermark.com/investors/30?key=#{APIKEY}"

number = "&per_page=20&page=1" 


# Startups
user_serialized = open(COMPANIES_BASEURL).read
result = JSON.parse(user_serialized)

company_name = result['company_name']
domain = result['domain']
=end