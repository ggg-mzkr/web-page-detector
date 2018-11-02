class DetectedWebPage

  # 日本語が含まれている時にUTF-8として認識されないのでエンコードしておく
  def initialize(url, encoding, title)
    @url      = url.encode('UTF-8', @encoding)
    @encoding = encoding.encode('UTF-8', @encoding)
    @title    = title.encode('UTF-8', @encoding)
  end

  def to_s
    "url: #{@url}\n" + "encoding: #{@encoding}\n" + "title: #{@title}\n"
  end

end
