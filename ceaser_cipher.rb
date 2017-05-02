def cipher string, key
  encode = string.split("")
  key%= 26
  encode.map!.each do |i|
    if ("A"..."z").include? (i)
      ascii_value = (i.ord + key)
      if (ascii_value>122 || (ascii_value > 90 && ascii_value <(97+key)))
        ascii_value -= 26
      end
      ascii_value.chr
    else
      i=i
    end
  end
  return encode.join
end

puts cipher("Hello how are you?", 5)
