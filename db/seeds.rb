# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   starship.create(name: 'Luke', movie: movies.first)
Garage.destroy_all
puts "destroying all characters..."
Character.destroy_all
puts "destroying all starships..."
Starship.destroy_all
puts "destroying all planets..."
Planet.destroy_all

require 'open-uri'
require 'json'

url = 'https://swapi.dev/api/'

s_json = JSON.parse(open("#{url}starships/").read)
c_json = JSON.parse(open("#{url}people/").read)
p_json = JSON.parse(open("#{url}planets/").read)


while true
    p_json["results"].each do |planet|
      Planet.create!(
      name: planet["name"],
      rotation_period: planet["rotation_period"],
      orbital_period: planet["orbital_period"],
      diameter: planet["diameter"],
      climate: planet["climate"],
      gravity: planet["gravity"],
      terrain: planet["terrain"],
      surface_water: planet["surface_water"],
      population: planet["population"]
     )
  end
  if p_json["next"]
    p_json = JSON.parse(open(p_json["next"]).read)
    puts "loading next planet page..."
  else
    break
  end
end

while true
    s_json["results"].each do |starship|
      Starship.create!(
        name: starship["name"],
        model: starship["model"],
        manufacturer: starship["manufacturer"],
        cost_in_credits: starship["cost_in_credits"],
        length: starship["length"],
        max_atmosphering_speed: starship["max_atmosphering_speed"],
        crew: starship["crew"],
        passengers: starship["passengers"],
        cargo_capacity: starship["cargo_capacity"],
        consumables: starship["consumables"],
        hyperdrive_rating: starship["hyperdrive_rating"],
        starship_class: starship["starship_class"]
     )
  end
  if s_json["next"]
    s_json = JSON.parse(open(s_json["next"]).read)
    puts "loading next starship page..."
  else
    break
  end
end


while true
   c_json["results"].each do |character|

    pilot = Character.new(
      name: character["name"],
      height: character["height"],
      mass: character["mass"],
      hair_color: character["hair_color"],
      skin_color: character["skin_color"],
      eye_color: character["eye_color"],
      birth_year: character["birth_year"],
      gender: character["gender"]
    )
    p_json = JSON.parse(open(character["homeworld"]).read)
    planet = Planet.find_by(name: p_json["name"])
    puts "setting #{pilot.name }planet to #{planet.name}..."
    pilot.planet = planet
    pilot.save

    if character["starships"].any?
      character["starships"].each do |starship|
        garage = Garage.new({})
        ship_json = JSON.parse(open(starship).read)
        ship = Starship.find_by(name: ship_json["name"])
        garage.starship = ship
        garage.character = pilot
        garage.save
        p ship.name
        p pilot.name
        puts "storing ship in garage"
      end
    end
  end
  if c_json["next"]
    c_json = JSON.parse(open(c_json["next"]).read)
    puts "loading next character page..."
  else
    break
  end
end

