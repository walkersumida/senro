# frozen_string_literal: true

module Senro
  class QueryParamsFormatter
    # Format RESTful API's query params to SQL order clause.
    # +: asc
    # -: desc
    # none(default): asc
    #
    # And convert camel case attributes to snake case one.
    #
    # @param param [String] format string. e.g. `+id,-name`
    # @return [String] formated stirng
    def self.sort(param)
      attributes = param.split(',')
      attributes.map do |attr|
        if /^\-/.match(attr).nil?
          "#{attr.strip.gsub(/^\+/, '').underscore} ASC"
        else
          "#{attr.strip.gsub(/^\-/, '').underscore} DESC"
        end
      end.join(', ')
    end
  end
end
