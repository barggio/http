require './stock'
require 'pry'
class Account
    def self.base_url
        'https://bargegeneric.stamplayapp.com/api/cobject/v1/brokeraccount'
    end
    
    def self.open_account(initial_amount)

        insert("open", "", 1, initial_amount)    
    end
    
    def self.buy_stocks(symbol, qty)
        price = STOCK.get_price(symbol)
        ticker = symbol.upcase 
        if (price)
            insert("buy", ticker, qty.to_f, qty.to_f * price.to_f)
        end
    end

    def self.sell_stocks(symbol, qty)
        price = STOCK.get_price(symbol)
        ticker = symbol.upcase 
        if (price)
            insert("sell", ticker, qty.to_f, qty.to_f * price.to_f)
        end
    end    

    def self.view_balance
        select_balance
    end
    
    def self.filter_transactions(type = nil)
        select_transaction.select { |t| t.type == "buy"}.map { |t| [t.symbol, t.qty, (t.amount * 1.0.to_f)] }
    end 
    
    def self.insert(txtype, ticker, quantity, amount)
        #binding.pry
        @burl = 'https://bargegeneric.stamplayapp.com/api/cobject/v1/brokeraccount'
        final_amount = (txtype == "buy") ? amount * -1.0.to_f : amount
        #payload = "{\"type\": \"#{txtype}\", \"symbol\" : \"#{ticker}\", \"quantity\" : #{quantity}, \"amount\" : #{final_amount}}"
        ahash = {type: txtype, symbol: ticker, quantity: quantity, amount: final_amount}
        HTTParty.post(@burl, {body: ahash})
    end 

    def self.select_transaction
        (HTTParty.get self.base_url).parsed_response["data"]
    end
    def self.select_balance
        response = select_transaction.inject(0) {|sum, a| sum + a["amount"].to_f}
    end
end 