require 'httparty'
require 'pry'
require 'json'
print 'Please type id [1:18]:'
num_length = gets
n = num_length.chomp
n = n.to_i 
if (n > 0 && n <= 18)
    url = 'http://pokeapi.co/api/v2/type/' + n.to_s 
    response = (HTTParty.get url)
    pokelist = response.parsed_response["pokemon"].map { |x| (x["pokemon"])["name"]}
    p "Here is the list of Pokemon(s)"
    print pokelist
    p ""
else
    print "Outside of allowable range."
    p ""
end
#binding.pry
#x=3