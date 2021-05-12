#list from https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/sub-strings
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings(sentence, dictionary)
    same = {} #create a hash for return
    dictionary.each do |word| #for each word in the array. Add them to the hash(same) 
        same[word] = sentence.downcase.scan(/(?=#{word})/).count if sentence.downcase.include?(word)
        #downcase is replace all the letters to a small caractère. That avoid scan to dont find it!
        # Scan need ()!.  ?=... is a positive lookahead. #normal symbal in ruby,{refer to the word}
    end 
   return same 
end

#return the number of time they got in a dictionary the word bellow
puts substrings("Below", dictionary)
#output >> { "below" => 1, "low" => 1 } 
#return the number of time they got in a dictionary all the wolrd of this list
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
#output >> { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }