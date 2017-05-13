def substrings words, dictionary
  counts=Hash.new(0)
  words_array=words.downcase.split(" ")
  words_array.each do |word|
    dictionary.each do |substring|
      if word[substring]
        counts[substring] +=1
      end
    end
  end
  puts counts
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)
