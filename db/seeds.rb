# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

links_attributes= [
  {url: "https://bigbinary.com/jobs"},
  {url: "https://yahoo.com"},
  {url: "https://hello.com/jobs"},
  {url: "https://facbook.com/jobs"},
  {url: "https://google.com/jobs"},
  {url: "https://hello.com/jobs"},
  {url: "https://hello.com/jobs"}
]


link_attributes.each do |attributes|
  Link.create(attributes)
end