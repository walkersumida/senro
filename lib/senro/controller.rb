# frozen_string_literal: true

module Senro #:nodoc:
  module Controller
    include Senro::QueryParamsFormatter

    def query_params_formatter_sort
      return if params[:sort].nil? || params[:sort] == ''

      params[:original_sort] = params[:sort].clone
      params[:sort] = Senro::QueryParamsFormatter.sort(params[:sort])
    end

    def query_params_formatter_query
      return if params[:q].nil? || params[:q] == ''

      params[:original_q] = params[:q].clone
      params[:q] = Senro::QueryParamsFormatter.query(params[:q])
    end
  end
end
