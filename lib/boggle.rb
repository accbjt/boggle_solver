require 'trie'

class BoggleSolver

  @@words = []

  @@dice_grid = [
   ['f', 'x', 'i', 'e'],
   ['a', 'm', 'l', 'o'],
   ['e', 'w', 'b', 'x'],
   ['a', 's', 't', 'u']
  ]

  def trie
    trie = Trie.new
    @@words.each do |word|
      trie.add word
    end
    trie
  end

  def find_uniq_words
    dice_flatten = @@dice_grid.flatten

    dice_flatten.each do |letter|
      File.open("boggle.dict.txt", "r") do |f|
        f.each_line do |line|
          if line.chomp.include?(letter)
            @@words.push(line.chomp)
          end
        end
      end
    end

    @@words = @@words.uniq
  end

  def words
    @@words
  end

  def neighbor_cell
    [ [-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1] ]
  end
end
