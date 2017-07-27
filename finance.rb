require 'httparty'
require 'pry'
require 'etc'
#require 'json'
print 'Enter your stock symbol:'
in_symbol = gets 
ticker = in_symbol.chomp.upcase


url = 'https://www.google.com/finance/getprices?q=' + ticker.to_s + '&x=NASD&i=120&p=25m&f=d,c,v,o,h,l&df=cpct&auto=1&ts=1501179683973&ei=vCl6WbGZHNSP2Abo3KPoDg'
while true
    content = (HTTParty.get url).body
    lines = content.split("\n")
    
    last_price = lines[lines.size - 1].split(",")[1] 
    p ticker + ' => $' + last_price.to_f.round(2).to_s
    sleep(10)
end 

binding.pry
x=3
