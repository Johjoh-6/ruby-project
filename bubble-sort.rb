#First try
def bubble_sort(array)
    #return to the array if is 0 object or 1
    array_length = array.size
    return array if array_length <= 1
    #Loop avoid to create the array outside and save some line (no like While)
    loop do
      swap = false #Var to avoid the infinity loop, need to be check
      #get the array lenght - 1 because that start at 0. Time permite to do it X time we need before check it again 
      (array_length - 1).times do |object|
          if array[object] > array[object+1]
            #replace the first object and if is smaller to the next one next, if not change the place
            array[object], array[object+1] = array[object+1], array[object]
            swap = true
            p array #print every change
          end
        end
      break if not swap #Very important for avoid a ifinity loop 
    end
    array #return array at the end of the loop
end
  

#Exercise from The Odin Projet
p bubble_sort([4,3,78,2,0,2])