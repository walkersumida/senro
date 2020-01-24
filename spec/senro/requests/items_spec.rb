require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /items?sort=id" do
    it "works! (now write some real specs)" do
      get items_path, params: { sort: 'id' }

      expect(response.request.env['action_controller.instance'].params['sort']).to eq('id ASC')
      expect(response.request.env['action_controller.instance'].params['original_sort']).to eq('id')
    end
  end

  describe "GET /items?sort=id,-name" do
    it "works! (now write some real specs)" do
      get items_path, params: { sort: 'id,-name' }

      expect(response.request.env['action_controller.instance'].params['sort']).to eq('id ASC, name DESC')
      expect(response.request.env['action_controller.instance'].params['original_sort']).to eq('id,-name')
    end
  end
end
