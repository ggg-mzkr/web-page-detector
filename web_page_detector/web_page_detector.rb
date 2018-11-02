require 'net/http'
require_relative '../char_code_detector//char_code_detector'
require_relative '../title_getter/title_getter'
require_relative './detected_web_page'

class WebPageDetector

  def initialize
    @t_getter = TitleGetter.new
    @detector = CharCodeDetector.new
  end

  def detect_web_page(url)
    responce = Net::HTTP.get(URI.parse(url))

    begin
      title = @t_getter.get_title(responce)
    rescue GetTitleFailedException
      title = '取得できませんでした'
    end

    begin
      encoding = @detector.detect(responce)
    rescue DetectFailedException
      encoding = '判別対象外'
    end

    DetectedWebPage.new(url, encoding, title)
  end

end
