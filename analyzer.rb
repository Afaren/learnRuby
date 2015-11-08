#Analyzer.rb --Text Analyzer

stop_words = %w{the a by on for of are with just but and to my I has some in}
lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join

#Count the characters
character_count = text.length
character_count_nospaces = text.gsub(/\s+/, '').length

#Count the words, sentences, and paragraphs
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

#Make a list of words in the text that aren't stop words
#count them, and work out the percentage fo non-stop words
#against all words
all_words = text.scan(/\w+/)
good_words = all_words.select{ |word| !stop_words.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

#Summaize the text by cherry picking soe choice sentences
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|\!/)
sentences_sorted = sentences.sort_by{ |sentence|sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1 )
ideal_sentences = ideal_sentences.select{ |sentences| sentences =~ /is|are/ }

#Give the analysis back to the user
puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters(excluding spaces)"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count } word per sentence(average)"
puts "#{good_percentage} %of words non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(".")
puts "--End of analysis"
