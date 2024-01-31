# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
chitwan = Place.create!(
  name: 'Chitwan',
  description: "Awesome place but it's too hot in the summer."
)

Event.create!(
  [
    {
      name: 'Jungle Safari',
      description: 'Explore Chitwan National Park on top of an elephant or on a jeep.',
      place: chitwan
    },
    {
      name: 'White water rafting',
      description: 'Surfe the fresh white waters of Narayani.',
      place: chitwan
    },
    {
      name: 'Museum Vist',
      description: 'Vist the famous elephant sanctuary of Chitwan National Park and get to know Matilda, the 10 foot tall giant.',
      place: chitwan
    }
  ]
)
