require_relative 'detect_failed_exception'

class RegexDetector

  def initialize
    @regex = /charset="?(?<code>[a-zA-Z0-9_-]+)"?/
  end

  def detect(responce)
    if (m = @regex.match(responce))
      return m['code']
    end

    raise DetectFailedException, 'regex detect failed'
  end

end
