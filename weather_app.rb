require "http"

system "clear"
puts "Welcome to the weather app!"

print "Enter a City "
city = gets.chomp

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&appid=API-KEY")

#pp response.parse(:json)
weather_data = response.parse(:json)
temperature = weather_data["main"]["temp"]
description = weather_data["weather"][0]["description"]

puts "Today in #{city} it is #{temperature} degrees outside with #{description}"
