require "http"

print "Enter a word : "
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=API-KEY")

#pp response.parse(:json)

dictionary_data = response.parse(:json)
text = dictionary_data[1]["text"]

#pp text
puts "#{word} : #{text}"
