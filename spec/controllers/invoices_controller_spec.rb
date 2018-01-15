require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  context 'GET' do
    it 'all success' do
  	  get :index, format: 'json'
  	  response.should have_http_status(:ok)
  	end

  	it 'invoice success' do
  	  invoice= FactoryGirl.create(:invoice)
  	  get :show, id: invoice.id, format: 'json'
  	  response.should have_http_status(:ok)
  	end
  end

  context 'POST' do
    it 'invoice success' do
      invoice = FactoryGirl.create(:invoice)
      post :create, invoice: { dish_name:invoice.dish_name, dish_price:invoice.dish_price, total:invoice.total }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'invoice not success' do
      post :create, invoice: { dish_name:'', dish_price:'', total:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end	
  end
  
  context 'PUT' do
  	it 'invoice success' do
  	  invoice = FactoryGirl.create(:invoice)
      put :update, id: invoice.id, invoice: { dish_name:invoice.dish_name, dish_price:invoice.dish_price, total:invoice.total }, format: 'json'
      response.should have_http_status(:ok)
  	end

  	it 'invoice not success' do
  	  invoice = FactoryGirl.create(:invoice)
      put :update, id: invoice.id, invoice: { dish_name:'', dish_price:'', total:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
  	end
  end

  context 'DELETE' do
  	it 'invoice success' do
  	  invoice = FactoryGirl.create(:invoice)
      delete :destroy, id: invoice.id, format: 'json'
      response.should have_http_status(:ok)
  	end
  end
end