# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'rest-client'

def generateBrewery
  brewery_info = []
  for id in (4272..8029)
    begin
      response_string = RestClient.get("https://api.openbrewerydb.org/breweries/#{id}")
      puts "brewery id: #{id}"
    rescue RestClient::ExceptionWithResponse => e
      puts "error from id: #{id}"
      puts e.response.body
      next
    end
    response_hash = JSON.parse(response_string)
    brewery_info.push(response_hash)

    Brewery.create(
      id: "#{brewery_info.last["id"]}",
      name: "#{brewery_info.last["name"]}",
      brewery_type: "#{brewery_info.last["brewery_type"]}",
      street: "#{brewery_info.last["street"]}",
      city: "#{brewery_info.last["city"]}",
      state: "#{brewery_info.last["state"]}",
      postal_code: "#{brewery_info.last["postal_code"]}",
      country: "#{brewery_info.last["country"]}",
      longitude: "#{brewery_info.last["longitude"]}",
      latitude: "#{brewery_info.last["latitude"]}",
      phone: "#{brewery_info.last["phone"]}",
      website_url: "#{brewery_info.last["website_url"]}",
    )

    # Review.create(brewery_id: "#{id}", user_id: "#{user_id}")
  end
end

generateBrewery