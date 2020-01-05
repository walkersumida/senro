# frozen_string_literal: true

module Senro
  class QueryParamsFormatter
    # Format RESTful API's query params to SQL order clause.
    # +: asc
    # -: desc
    # none(default): asc
    #
    # @param param [String] format string. e.g. `+id,-name`
    # @return [String] formated stirng
    def self.sorting(param)
      attributes = param.split(',')
      attributes.map do |attr|
        if /^\-/.match(attr).nil?
          "#{attr.strip.gsub(/^\+/, '')} ASC"
        else
          "#{attr.strip.gsub(/^\-/, '')} DESC"
        end
      end.join(', ')
    end
  end
end
