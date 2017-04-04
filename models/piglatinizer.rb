class PigLatinizer
  def to_pig_latin(sentence)
    sentence.gsub('.','').split(' ').collect do |word|
      piglatinize( word )
    end.compact.join(' ')
  end

  def piglatinize(word)
    if capture = consonant_expression.match(word)
      capture.post_match.to_s + capture.to_s + 'ay'
    elsif vowel?(first_letter=word[0].downcase)
      word + 'way'
    end
  end

  # Move last letter to beginning of word
  def move_last_letter(word)
    word[-1] +  word[0..-2]
  end

  private
  def consonant_expression
    # at the beginning of a String
    # capture anything not a vowel (consonants)
    # capture 1, 2 or 3 occurences
    # ignore case and whitespace
    /^ [^aeiou] {1,3}/ix
  end

  def vowel?(letter)
    vowels.include?(letter)
  end

  def vowels
    %w[a e i o u]
  end
end

# def break_words_into_array
#   words = string.downcase.split(' ')
#   words.each_with_index do |word, i|
#     if word[-1].match(/[.?!,]/)
#       words.insert( i + 1, word[-1] )
#       words[i] = word[0..-2]
#     end
#   end
# end
#
# def morph
#   words = break_words_into_array
#   morphed_words = words.map do |word|
#     first_vowel = word.index(/[aeiou]/)
#     if first_vowel == 0
#       word + 'way'
#     elsif !word.match(/[.?!,]/)
#       word[first_vowel..-1] + word[0..(first_vowel - 1)] + 'ay'
#     else
#       word
#     end
#   end
#
#   morphed_string = morphed_words.each_with_object('') do |word, string|
#     if !!word.match(/[.?!,]/)
#       string << word
#     else
#       string << " #{word}"
#     end
#   end
#   morphed_string.strip
# end
