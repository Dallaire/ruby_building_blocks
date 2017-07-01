require_relative "../ceaser_cipher"

describe ".cipher" do
  context "empty string" do
    it "returns a message stating string was empty" do
      expect(cipher('',0)).to eql("empty input")
    end
  end

  context 'given a key of 0' do
    it 'returns the origional string' do
      expect(cipher('abc',0)).to eql('abc')
    end
  end

  context 'given lowercase string and a key that wont cause a wrap around' do
    it 'returns the shifted message' do
      expect(cipher('abcd',4)).to eql('efgh')
    end
  end

  context 'given uppercase string and a key that wont cause a wrap around' do
    it 'returns shifted message' do
      expect(cipher('ABCD',4)).to eql('EFGH')
    end
  end

  context 'given a key that cause a wrap around' do
    it 'returns shifted message' do
      expect(cipher('xyz',3)).to eql('abc')
    end
  end
end
