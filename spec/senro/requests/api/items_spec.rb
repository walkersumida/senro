require 'rails_helper'

RSpec.describe 'Api::Items', type: :request do
  describe 'GET /api/items?sort=id' do
    it 'returns a formatted sort param' do
      get api_items_path, params: { sort: 'id' }

      expect(response.request.env['action_controller.instance'].params['sort']).to eq('id ASC')
      expect(response.request.env['action_controller.instance'].params['original_sort']).to eq('id')
    end
  end

  describe 'GET /api/items?sort=id,-name' do
    it 'returns a formatted sort param' do
      get api_items_path, params: { sort: 'id,-name' }

      expect(response.request.env['action_controller.instance'].params['sort']).to eq('id ASC, name DESC')
      expect(response.request.env['action_controller.instance'].params['original_sort']).to eq('id,-name')
    end
  end
end
