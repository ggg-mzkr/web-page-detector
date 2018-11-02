class DetectedWebPage

  def initialize(url, encoding, title)
    @url = url
    @encoding = encoding
    @title = title
  end

  def to_s
    "url: #{@url}\n" + "encoding: #{@encoding}\n" + "title: #{@title}\n"
  end

end
