require_relative './regex_getter'
require_relative './get_title_failed_exception'

class TitleGetter

  def initialize
    @detectors = [RegexGetter.new]
  end

  def get_title(responce)
    @detectors.each do |g|
      begin
        return g.get_title(responce)
      rescue GetTitleFailedException
        next
      end
    end

    raise GetTitleFailedException, 'all get_title failed'
  end

end
