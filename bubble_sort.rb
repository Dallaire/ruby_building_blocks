def bubble_sort(array)
  flag=false
  while !flag
    flag=true
    for i in 0...((array.length) -1)
      if array[i]>array[i+1]
        array[i],array[i+1]=array[i+1],array[i]
        flag=false
      end
    end
  end
  return array
end

print bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
  flag=false
  while !flag
    flag=true
    for i in 0...((array.length) -1)
      if yield(array[i], array[i+1]) >0
        array[i],array[i+1]=array[i+1],array[i]
        flag=false
      end
    end
  end
  return array
end

print bubble_sort_by(["hi","hello","hey"]){
  |left, right|
  left.length - right.length
}
