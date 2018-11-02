require 'minitest/autorun'
require_relative '../../src/char_code_detector/regex_detector'
require_relative '../../src/char_code_detector/detect_failed_exception'

class RegexDetectorTest < Minitest::Test

  def setup
    @sut = RegexDetector.new
  end

  def test_detect_uft8
    data_set = %w[uft-8 UTF-8 UtF-8]
    data_set.each do |d|
      assert_equal d, @sut.detect('<meta charset="' + d + '">')
    end
  end

  def test_detect_shift_jis
    data_set = %w[shift-jis SHIFT-JIS Shift-JIS]
    data_set.each do |d|
      assert_equal d, @sut.detect('<meta charset="' + d + '">')
    end
  end

  def test_detect_euc_j
    data_set = %w[euc-j EUC-J EuC-J]
    data_set.each do |d|
      assert_equal d, @sut.detect('<meta charset="' + d + '">')
    end
  end

  def test_exception
    e = assert_raises DetectFailedException do
      @sut.detect('<meta charset="">')
    end
    assert_equal 'regex detect failed', e.message
  end

end
