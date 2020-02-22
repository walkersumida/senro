# frozen_string_literal: true

module Senro
  module QueryParamsFormatter
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
      attributes.map! do |attr|
        if /^\-/.match(attr).nil?
          "#{attr.strip.gsub(/^\+/, '').underscore} ASC"
        else
          "#{attr.strip.gsub(/^\-/, '').underscore} DESC"
        end
      end
      attributes.join(', ')
    end

    # Format RESTful API's query params to SQL where clause.
    #
    # And convert camel case attributes to snake case one.
    #
    # @param param [String] format string. e.g. `is:open is:close senro gem`
    # @return [String] formated stirng
    def self.query(param)
      data = { query: ''.dup, status: {} }
      elements = param.split(' ')
      elements.each_with_object(data) do |ele, h|
        if ele.include? ':'
          ary = ele.split(':')
          h[:status][ary[0].underscore.to_sym] =
            Array(h[:status][ary[0].underscore.to_sym]) << ary[1]
        else
          h[:query] << (h[:query] == '' ? ele : " #{ele}")
        end
      end
    end
  end
end
