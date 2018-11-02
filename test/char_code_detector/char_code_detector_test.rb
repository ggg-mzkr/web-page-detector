require 'minitest/autorun'
require_relative '../../src/char_code_detector/char_code_detector'
require_relative '../../src/char_code_detector/detect_failed_exception'

class CharCodeDetectorTest < Minitest::Test

  def setup
    @sut = CharCodeDetector.new
  end

  def test_detect_valid_code
    data_set = %w[UTF-8 EUC-JP Shift-JIS]
    data_set.each do |d|
      assert_equal d, @sut.detect('<meta charset="' + d + '">')
    end
  end

  def test_detect_invalid_code
    data_set = %w[UTF-16 JIS ASCII]
    data_set.each do |d|
      e = assert_raises DetectFailedException do
        @sut.detect('<meta charset="' + d + '">')
      end
      assert_equal 'all detect failed', e.message
    end
  end

  def test_exception
    e = assert_raises DetectFailedException do
      @sut.detect('<meta charset="">')
    end
    assert_equal 'all detect failed', e.message
  end

end
