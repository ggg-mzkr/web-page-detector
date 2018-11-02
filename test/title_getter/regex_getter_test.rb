require 'minitest/autorun'
require_relative '../../src/title_getter/regex_getter'
require_relative '../../src/title_getter/get_title_failed_exception'

class RegexGetterTest < Minitest::Test

  def setup
    @sut = RegexGetter.new
  end

  def test_get_title
    assert_equal 'title', @sut.get_title('<title>title</title>')
  end

  def test_exception
    e = assert_raises GetTitleFailedException do
      @sut.get_title('<title></title>')
    end
    assert_equal 'regex get_title failed', e.message
  end

end
