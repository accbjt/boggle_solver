require 'spec_helper'

describe 'Boggle_Solver' do
	let (:boggle){ BoggleSolver.new }

	it 'BoggleSolver#find_uniq_words' do
		uniq_words = boggle.find_uniq_words
		expect_any_instance_of(Array)
	end

	it 'BoggleSolver#trie' do
		expect(boggle.trie.class).to eq(Trie)
	end

	it 'BoggleSolver#neighbor_cell' do
		neighbor = boggle.neighbor_cells
		expect(neighbor).to eq([[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]])
	end
end
