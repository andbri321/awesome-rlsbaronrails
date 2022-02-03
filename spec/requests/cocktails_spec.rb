# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'v1/cocktails', type: :request do
  let(:valid_attributes) do
    FactoryBot.build(:cocktail).attributes.symbolize_keys
  end

  let(:invalid_attributes) do
    invalid_attributes = FactoryBot.build(:cocktail).attributes.symbolize_keys
    invalid_attributes[:category_id] = nil
    invalid_attributes
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Cocktail.create! valid_attributes
      get v1_cocktails_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      cocktail = Cocktail.create! valid_attributes
      get v1_cocktail_url(cocktail), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Cocktail' do
        expect do
          post v1_cocktails_url,
               params: { cocktail: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Cocktail, :count).by(1)
      end

      it 'renders a JSON response with the new cocktail' do
        post v1_cocktails_url,
             params: { cocktail: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Cocktail' do
        expect do
          post v1_cocktails_url,
               params: { cocktail: invalid_attributes }, as: :json
        end.to change(Cocktail, :count).by(0)
      end

      it 'renders a JSON response with errors for the new cocktail' do
        post v1_cocktails_url,
             params: { cocktail: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        FactoryBot.build(:cocktail).attributes.symbolize_keys.except(:id, :created_at, :updated_at)
      end

      it 'updates the requested cocktail' do
        cocktail = Cocktail.create! valid_attributes
        cocktail_old = cocktail
        patch v1_cocktail_url(cocktail),
              params: { cocktail: new_attributes }, headers: valid_headers, as: :json
        cocktail.reload
        response_json = JSON.parse(response.body)
        expect(response_json).to match(hash_including(
                                         'name' => new_attributes[:name]
                                       ))
      end

      it 'renders a JSON response with the cocktail' do
        cocktail = Cocktail.create! valid_attributes
        patch v1_cocktail_url(cocktail),
              params: { cocktail: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the cocktail' do
        cocktail = Cocktail.create! valid_attributes
        patch v1_cocktail_url(cocktail),
              params: { cocktail: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested cocktail' do
      cocktail = Cocktail.create! valid_attributes
      expect do
        delete v1_cocktail_url(cocktail), headers: valid_headers, as: :json
      end.to change(Cocktail, :count).by(-1)
    end
  end
end
