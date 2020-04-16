require 'rails_helper'

RSpec.describe 'Api::Items', type: :request do
  describe 'GET /api/items?sort=id' do
    it 'returns a formatted sort param' do
      get api_items_path, params: { sort: 'id' }

      expect(response.request.env['action_controller.instance'].params['sort']).
        to eq(ActionController::Parameters.new({ id: 'asc' }))
      expect(response.request.env['action_controller.instance'].params['original_sort']).to eq('id')
    end
  end

  describe 'GET /api/items?sort=id,-name' do
    it 'returns a formatted sort param' do
      get api_items_path, params: { sort: 'id,-name' }

      expect(response.request.env['action_controller.instance'].params['sort']).
        to eq(ActionController::Parameters.new({ id: 'asc', name: 'desc' }))
      expect(response.request.env['action_controller.instance'].params['original_sort']).to eq('id,-name')
    end
  end

  describe 'GET /api/items?q=is:open+senro+gem' do
    it 'returns a formatted q param' do
      get api_items_path, params: { q: 'is:open senro gem' }

      instance = response.request.env['action_controller.instance']
      expect(instance.params['q']).
        to eq({ 'query' => 'senro gem', 'status' => { 'is' => ['open'] } })
      expect(instance.params['original_q']).to eq('is:open senro gem')
    end
  end
end
