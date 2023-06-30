require "http"

#system("open http://google.com")

while true
  print "Enter a word : "
  word = gets.chomp

  if word == "q"
    break
  end

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=API-KEY")

  #pp response.parse(:json)

  dictionary_data = response.parse(:json)
  text = dictionary_data[1]["text"]

  response2 = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=API-KEY")

  #pp response
  audio_data = response2.parse(:json)
  #pp audio_data

  audio = audio_data[0]["fileUrl"]

  #pp audio_data
  #pp text
  puts "#{word} : #{text}"

  #pp text
  puts "Pronounciation link : "
  #puts audio
  system("open", audio) #{audio}"
end
