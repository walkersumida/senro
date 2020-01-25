class Api::ApplicationController < ActionController::API
  include Senro::Controller
  before_action :query_params_formatter_sort
end
