# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

links_attributes= [
  {url: "https://bigbinary.com/jobs", short_url:"IGjn98Ty"},
  {url: "https://yahoo.com", short_url:"IGjn9rTy"},
  {url: "https://hello.com/jobs", short_url:"IGh47dTy"},
  {url: "https://facbook.com/jobs", short_url:"o8jn98xc"},
  {url: "https://google.com/jobs", short_url:"0jin96Py"},
  {url: "https://hello.com/jobs", short_url:"KJ7IG8Ty"},
  {url: "https://hello.com/jobs", short_url:"8Ih6l0Ty"}
]


links_attributes.each do |attributes|
  Link.create(attributes)
end