require_relative '../lib/GameOfLife'

RSpec.describe GameOfLife do
  before do
    @board = [[0,1,0],[0,1,0],[0,1,0]]
  end
  subject { described_class.new(3, 3) }

  describe '#initialize' do
    context "when board size is created" do

      let(:row){3}
      let(:column){3}
      let(:last_row){2}
      let(:last_column){2}

      it "has row length" do
        expect(subject.row).to eq 3
      end
      it "has column length" do
        expect(subject.column).to eq 3
      end
      it "has last row length" do
        expect(subject.last_row).to eq 2
      end
      it "has last column length" do
        expect(subject.last_column).to eq 2
      end
    end
  end
  context '#display_board' do
    it "print board" do
      expect do
        subject.display_board(@board)
      end.to output(" 0 \n 0 \n 0 \n").to_stdout
    end
  end
  context '#get_neighbors' do
    it "at position [0,0]" do
      expect(subject.get_neighbors(@board,0,0)).to eq 2 #[1,0,1]
    end
    it "at position [0,1]" do
      expect(subject.get_neighbors(@board,0,1)).to eq 1 #[0,0,0,1,0]
    end
    it "at position [0,2]" do
      expect(subject.get_neighbors(@board,0,2)).to eq 2 #[1,1,0]
    end
    it "at position [1,0]" do
      expect(subject.get_neighbors(@board,1,0)).to eq 3 #[0,1,1,0,1]
    end
    it "at position [1,1]" do
      expect(subject.get_neighbors(@board,1,1)).to eq 2 #[0,1,0,0,0,0,1,0]
    end
    it "at position [1,2]" do
      expect(subject.get_neighbors(@board,1,2)).to eq 3 #[1,0,1,1,0]
    end
    it "at position [2,0]" do
      expect(subject.get_neighbors(@board,2,0)).to eq 2 #[0,1,1]
    end
    it "at position [2,1]" do
      expect(subject.get_neighbors(@board,2,1)).to eq 1 #[0,1,0,0,0]
    end
    it "at position [2,2]" do
      expect(subject.get_neighbors(@board,2,2)).to eq 2 #[1,0,1]
    end
  end
end
