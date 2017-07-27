require './account'

#Account.open_account(7000)
#binding.pry
state = 1
menu_ok = 1
while (state == 1)
    while (menu_ok == 1)
        p "Select your transaction "
        p "1) Buy Stock"
        p "2) View Balance"
        p "3) View Purchase"
        p "4) Exit"
    
        sel = gets
        option = sel.chomp.to_i 
        menu_ok = (option >= 1 && option <= 4) ? 0 : 1
    end 
    if (option == 1)
        print "Which stock do you want to buy?"    
        input = gets
        ticker = input.chomp.upcase
        print "Enter quantity:"
        input = gets 
        qty = input.chomp.to_i 
        Account.buy_stocks(ticker, qty)
        #Validate if qty is a number
        #Validate that ticker doesn't have space
    end
    if (option == 2)
        bal = Account.select_balance
        p "Balance is $" + bal.to_s 
    end 
    
    if (option == 3)
        arr_tx = Account.select_transaction
        puts arr_tx.select {|t| t["type"].to_s == "buy" }.map { |t| "Symbol: " + t["symbol"].to_s + " Quanity: " + t["quantity"].to_s + " Amount Paid: " + t["amount"].to_s }
    end
    
    if (option == 4)
        state = 0
        p "Exiting the program."
    end 
    option = 0
    menu_ok = 1
    p ""
    p "-------------------------------------------"
end