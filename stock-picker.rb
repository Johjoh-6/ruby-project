#First test
def stock_picker(prices)
   
    #Identify the upcrease in the array prices
     up_price = prices.chunk_while {|a, b| a <= b }.to_a
    p up_price
     #get the best profit between the smallest and biggest
     up_price.each_entry do {|price, day| p "#{price} => #{day}"}
        # p price.max
        # p price.min
     end
     #get the day from the lowest price until the highest price
      p result
     higher = result.max
    lower = result.min
    profit = higher - lower  
    # Sentence for the exercices with value
    p "Buy for #{lower} on a day #{prices.index(lower)} and sell for #{higher}  on a day #{prices.rindex(higher)} for a profit of #{profit}"
 end
 stock_picker([17,1,15,3,6,9,15,8,6,15,1,30])

#Second try with double loop
# def stock_picker(prices)
#     profit = {}
#     price_buy = 0
#     price_sell  = 0
#    prices.each_with_index do |price_buy, day_buy|
#         prices.each_with_index do |price_sell, day_sell|
#             if day_sell > day_buy
#                 profit = price_sell - price_buy
#                 price_buy = price_buy
#                 price_sell = price_sell
#             end
#         end
#    end
#    # Sentence for the exercices with value
#     p "Buy for #{price_buy} on a day #{prices.index(price_buy)} and sell for #{price_sell}  on a day #{prices.index(price_sell)} for a profit of #{profit}"
# end


# Exercices array
# stock_picker([17,3,6,9,15,8,6,1,10])
#Trouble with the first try, if one other number is the same and appears before the index will be the first same number. Or with rindex refer to the first same last number 