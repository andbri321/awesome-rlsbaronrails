# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::CocktailsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'v1/cocktails').to route_to('v1/cocktails#index')
    end

    it 'routes to #show' do
      expect(get: 'v1/cocktails/1').to route_to('v1/cocktails#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'v1/cocktails').to route_to('v1/cocktails#create')
    end

    it 'routes to #update via PUT' do
      expect(put: 'v1/cocktails/1').to route_to('v1/cocktails#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'v1/cocktails/1').to route_to('v1/cocktails#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'v1/cocktails/1').to route_to('v1/cocktails#destroy', id: '1')
    end
  end
end
