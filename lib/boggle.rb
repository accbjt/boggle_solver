require 'trie'

class BoggleSolver

  @@words = []
  @@position_on =[]
  @@previous = Array.new(4) { [false] * 4 }

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

  def neighbor_cells
    [ [-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1] ]
  end

  def next_one(x, y)
    @@previous[x][y] = true
    node = trie.root
    @@position_on.push([x,y])
    neighbor_cells.each do |dx,dy|
      next unless (0..3)===(x+dx) # make sure we are still on grid
      next unless (0..3)===(y+dy) #
      next if @@previous[x+dx][y+dy]

      node.walk!(@@dice_grid[x][y])
      @@position_on.push([x+dx,y+dy])

      if @@previous[x+dx][y+dy]
        if node.walk!(@@dice_grid[x+dx][y+dy])
          puts "node = #{node.full_state}"
          puts "dice = #{@@dice_grid[x+dx][y+dy]}"
          next_one(x+dx,y+dy)
        end
      end
    end
    puts "#{@@previous}"
    @@previous_dice = false
  end

  def boggle_solver
    find_uniq_words
    trie
    next_one(1, 1)
  end

end
