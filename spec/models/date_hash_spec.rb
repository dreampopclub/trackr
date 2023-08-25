describe DateHash do
  let(:today) { Date.today }
  describe '#initialzie' do
    it 'sets date_hash' do
      dh = DateHash.new({})
      expect(dh.date_hash).to eq({})
    end
    it 'raises if not initialized with a hash' do
      expect { DateHash.new('') }.to raise_error('date_hash must be a hash')
    end
  end
  describe '#add_date' do
    context 'when no date arg is passed' do
      it 'Adds today' do
        dh = DateHash.new({})
        expect(dh.add_date).to eq({ '2023' => { '8' => { '25' => true }}})
      end
    end
    context 'when the year and month exist in the date hash' do
      it 'Adds the day passed' do
        yesterday = today - 1.day
        expected = {
          today.year.to_s => {
            today.month.to_s => {
              today.day.to_s => true,
              yesterday.day.to_s => true
            }
          }
        }
        dh = DateHash.new({})
        dh.add_date
        expect(dh.add_date(yesterday)).to eq(expected)
      end
    end
    context 'when the year exists but the month does not in the date hash' do
      it 'Adds the day passed' do
        last_year = today - 1.year
        expected = {
          today.year.to_s => {
            today.month.to_s => {
              today.day.to_s => true,
            }
          },
          last_year.year.to_s => {
            last_year.month.to_s => {
              last_year.day.to_s => true,
            }
          }
        }
        dh = DateHash.new({})
        dh.add_date
        expect(dh.add_date(last_year)).to eq(expected)
      end
    end
    context 'when adding a day that already exists' do
      it 'raises an error' do
        dh = DateHash.new({})
        dh.add_date
        expect { dh.add_date }.to raise_error('day already logged')
      end
    end
  end
end
