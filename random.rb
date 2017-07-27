require 'httparty'
require 'pry'
require 'json'
print 'Please enter a number:'
num_length = gets
n = num_length.chomp
url = 'https://qrng.anu.edu.au/API/jsonI.php?length=' + n.to_s + '&type=uint16'
response = HTTParty.get url
hash_payload = JSON.parse(response.body)
avg = hash_payload["data"].inject(0){ |sum, i| sum + i }.to_f / n.to_f

binding.pry
#just to make sure it stops
x = 3