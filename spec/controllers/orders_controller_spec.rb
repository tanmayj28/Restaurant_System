require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  context 'GET' do
    it 'all success' do
  	  get :index, format: 'json'
  	  response.should have_http_status(:ok)
  	end

  	it 'order success' do
  	  order= FactoryGirl.create(:order)
  	  get :show, id: order.id, format: 'json'
  	  response.should have_http_status(:ok)
  	end
  end

  context 'POST' do
    it 'order success' do
      order = FactoryGirl.create(:order)
      post :create, order: { dish_name:order.dish_name, dish_price:order.dish_price }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'order not success' do
      post :create, order: { dish_name:'', dish_price:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end	
  end
  
  context 'PUT' do
  	it 'order success' do
  	  order = FactoryGirl.create(:order)
      put :update, id: order.id, order: { dish_name:order.dish_name, dish_price:order.dish_price }, format: 'json'
      response.should have_http_status(:ok)
  	end

  	it 'order not success' do
  	  order = FactoryGirl.create(:order)
      put :update, id: order.id, order: { dish_name:'', dish_price:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
  	end
  end

  context 'DELETE' do
  	it 'order success' do
  	  order = FactoryGirl.create(:order)
      delete :destroy, id: order.id, format: 'json'
      response.should have_http_status(:ok)
  	end
  end
end
