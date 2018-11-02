require_relative './regex_detector'
require_relative './encoding_detector'

class CharCodeDetector

  def initialize
    @detectors = [RegexDetector.new,
                  EncodingDetector.new]
    @codes = %w[UTF-8 EUC-JP Shift-JIS]
  end

  def detect(responce)
    @detectors.each do |d|
      begin
        code = d.detect(responce)
        # code が @codes に含まれるか，大文字小文字区別無しでチェック.
        return code if @codes.inject(false) { |m, c| m || code.casecmp(c) }
      rescue DetectFailedException
        next
      end
    end
    raise DetectFailedException, 'all detect failed'
  end

end
