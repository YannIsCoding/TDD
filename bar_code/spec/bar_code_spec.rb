# test for the bar_code

require_relative '../bar_code'

describe '#bar_code' do
  it 'return the bar-code base' do
    expect(reader('TREWT-23RET-3')).to eq('TREWT-23RET')
  end

  it 'doesnt brake if you give it the base code' do
    expect(reader('TREWT-23RET')).to eq('TREWT-23RET')
  end

  it 'work with legacy format' do
    expect(reader('TREWT-2')).to eq('TREWT')
  end

  it 'return a capialized code if given small letters' do
    expect(reader('TjeWT-23RET')).to eq('TJEWT-23RET')
  end

  it 'is a none destructive method' do
    given = 'TREWT-23RET-9'
    expected = 'TREWT-23RET'
    expect(given).to eq('TREWT-23RET-9')
    expect(reader(expected)).to eq('TREWT-23RET')
  end
end
