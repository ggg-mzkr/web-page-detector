require_relative './get_title_failed_exception'

class RegexGetter

  def initialize
    @regex = %r{[<]title[>](?<title>.+)[<]\/title[>]}i
  end

  def get_title(responce)
    if (m = @regex.match(responce))
      return m['title']
    end

    raise GetTitleFailedException, 'regex get_title failed'
  end

end
