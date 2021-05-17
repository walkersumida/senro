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
      return {} if param.blank?

      attributes = param.split(',')
      attributes.each_with_object({}) do |attr, hash|
        if /^\-/.match(attr).nil?
          hash[attr.strip.gsub(/^\+/, '').underscore.to_sym] = 'asc'
        else
          hash[attr.strip.gsub(/^\-/, '').underscore.to_sym] = 'desc'
        end
      end
    end

    # Format RESTful API's query params to SQL where clause.
    #
    # And convert camel case attributes to snake case one.
    #
    # @param param [String] format string. e.g. `is:open is:close senro gem`
    # @return [String] formated stirng
    def self.query(param)
      data = { query: ''.dup, status: {} }

      return data if param.blank?

      elements = param.split(' ')
      elements.each_with_object(data) do |ele, h|
        if ele.include? ':'
          ary = ele.split(':', 2)
          h[:status][ary[0].underscore.to_sym] =
            Array(h[:status][ary[0].underscore.to_sym]) << ary[1]
        else
          h[:query] << (h[:query] == '' ? ele : " #{ele}")
        end
      end
    end
  end
end
