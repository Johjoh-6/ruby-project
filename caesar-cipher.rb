
  def change_letter(text, shift, result = '')
    text.each_char do |char|
      #ASCII code, that is a HTML number for a rotation of the text!
      #91 = ], 90 = Z,  65 = A, 97 = a, 122 = z;
      # change the < to > work but change not what they ask in The odin project : ('Aa Zz', 5) >> zL yK
      #With < ('Aa Zz', 5) >> Ff Ee. So work but in totaly reverse!
      letter = char.ord < 91 ? 65 : 97
      if char.ord.between?(65, 90) || char.ord.between?(97, 122)
        #get the letter en change is value with the number shift divide by 26 (alphat letter)
        change =  (((char.ord + shift - letter) % 26 ) + letter)
        result += change.chr
      else
        #for kept space and caract spé
        result += char
      end
    end
     result
  end

puts change_letter('Aa Zz', 5)
