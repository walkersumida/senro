# frozen_string_literal: true

module Senro #:nodoc:
  module Controller
    include Senro::QueryParamsFormatter

    def query_params_formatter_sort
      return if params[:sort].nil? || params[:sort] == ''

      params[:original_sort] = params[:sort].clone
      params[:sort] = Senro::QueryParamsFormatter.sort(params[:sort])
    end
  end
end
