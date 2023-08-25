;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

describe DateHash do
  # test "the truth" do
  #   assert true
  # end

  describe '#initialize' do
    it 'inits with an empty hash when no arg is passed' do
      dh = DateHash.new
      assert_equal dh.date, {}
    end
    it 'inits with an empty hash when no arg is passed' do
      debugger
      dh = DateHash.new()
      assert_equal dh.date, {}
    end
  end
  # describe '#add_date' do
  #   context 'when no date arg is passed' do

  #     it 'boo' do
  #       log = DateHash.new
  #       true.must_equal false
  #     end
  #   end
  # end
end
