#First test
def stock_picker(prices)
    profit = {}
    #Set the key to the value
    price = prices.map.with_index { |price, day| [price, day] }
    #Identify the upcrease in the array prices
    up_price = prices.chunk_while {|a, b| a <= b }.to_a
    #get the size of the value to check, do for each group in a array, get the between before the biggest and smallest
    up_price.each_with_index do |group_price|
        max = group_price.max #max price of the group
        min = group_price.min #min price of the group
        profit[[min, max]] = max - min #profit for each group and the value from the cheapest and highest
    end
    #sort by profit value
    profit = profit.sort_by {|k,v| v}
    #return the last of the array
    result = profit[-1]
    # Sentence for the exercices with value
    p "Buy for #{result[0][0]}$ and sell for #{result[0][1]}$ for a profit of #{result[1]}$"
 end
 stock_picker([17,1,15,3,6,9,15,8,6,15,1,30,16,17])
 #Get only the price of the value and not the day

#Second try with double loop
# def stock_picker(prices)
#     #set an hash
#     profit = {}
#     #first loop, set a price and a day 
#     prices.each_with_index do |price_buy, day_buy|
#         #second loop, set a price and a day
#         prices.each_with_index do |price_sell, day_sell|
#             if day_sell > day_buy #avoid to get an other number from the begining of the hash
#                 profit[[day_buy, day_sell]] = price_sell - price_buy #set profit with a double value !important for after and get the value of profit
#             end
#         end
#    end
#    p profit
#    #sort by value of the hash selected smallest to the bigest
#    profit = profit.sort_by {|key, value| value}
#    #this [-1] is for get the last 
#    max_profit = profit[-1]
#    # Sentence for the exercices with value
#     p "Buy on a day #{max_profit[0][0]} and sell on a day #{max_profit[0][1]} for a profit of #{max_profit[1]}"
# end


# # Exercices array
# stock_picker([17,3,6,9,15,8,6,1,10])
#Trouble with the first try, if one other number is the same and appears before the index will be the first same number. Or with rindex refer to the first same last number 
