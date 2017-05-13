def stock_picker array
  biggest_profit=0
  buy_sell=[]
  for i in 0..(array.length-2) do
    for j in (i+1)..(array.length-1) do
      if (array[j]-array[i] > biggest_profit)
        biggest_profit=array[j]-array[i]
        buy_sell=[i,j]
      end
    end
  end
  puts "buy day: #{i} and sell day: #{j} for a profit of $#{biggest_profit}"
end

stock_picker([17,3,6,9,15,8,6,1,10])
