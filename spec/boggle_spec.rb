require 'spec_helper'

describe 'Boggle_Solver' do
  it 'BoggleSolver#find_uniq_words' do
    boggle  = BoggleSolver.new 
    uniq_words = boggle.find_uniq_words
    expect_any_instance_of(Array)
  end

  it 'BoggleSolver#trie' do
    boggle  = BoggleSolver.new
    trie = boggle.trie
    expect_any_instance_of(Object)
  end

  it 'BoggleSolver#neighbor_cell' do
    boggle  = BoggleSolver.new
    neighbor = boggle.neighbor_cell
    expect(neighbor).to eq([[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]])
  end
end
