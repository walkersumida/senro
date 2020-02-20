class ApplicationController < ActionController::Base
  include Senro::Controller
  before_action :query_params_formatter_sort
  before_action :query_params_formatter_query
end
