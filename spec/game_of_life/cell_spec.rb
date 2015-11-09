require 'spec_helper'

module GameOfLife
  describe Cell do

    def create_neighbours(i)
      neighbours = []
      j = 8 - i
      while i >= 1 do
        neighbours << Cell.new_alive_cell
        i -= 1
      end
      while j >= 1 do
        neighbours <<  Cell.new_dead_cell
        j -=  1
      end
      neighbours
    end

    context 'cell birth' do
      it 'should create an alive cell' do
        expect(Cell.new_alive_cell.is_alive?).to eq(true)
      end

      it 'should create a dead cell' do
        expect(Cell.new_dead_cell.is_dead?).to eq(true)
      end
    end

    context 'next generation of live cell' do
      cell = Cell.new_alive_cell
      it 'should die if only one of neighbour is alive' do
        expect(cell.survive?(create_neighbours(1))).to eq(false)
      end
    end
  end
end