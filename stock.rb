require 'httparty'

class STOCK
    def self.get_price(ticker)
        #&x=NASD
        url = 'https://www.google.com/finance/getprices?q=' + ticker.to_s.upcase + '&i=120&p=25m&f=d,c,v,o,h,l&df=cpct&auto=1&ts=1501179683973&ei=vCl6WbGZHNSP2Abo3KPoDg'
        content = (HTTParty.get url).body
        lines = content.split("\n")
        last_price = lines[lines.size - 1].split(",")[1] 
    end
end