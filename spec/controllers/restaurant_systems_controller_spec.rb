require 'rails_helper'

RSpec.describe RestaurantSystemsController, type: :controller do
  context 'GET' do
    it 'all success' do
  	  get :index, format: 'json'
  	  response.should have_http_status(:ok)
  	end

  	it 'restaurant_system success' do
  	  restaurant_system= FactoryGirl.create(:restaurant_system)
  	  get :show, id: restaurant_system.id, format: 'json'
  	  response.should have_http_status(:ok)
  	end
  end

  context 'POST' do
    it 'restaurant_system success' do
      restaurant_system = FactoryGirl.create(:restaurant_system)
      post :create, restaurant_system: { name:restaurant_system.name, phone:restaurant_system.phone, address:restaurant_system.address }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'restaurant_system not success' do
      post :create, restaurant_system: { name:'', phone:'', address:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end	
  end
  
  context 'PUT' do
  	it 'restaurant_system success' do
  	  restaurant_system = FactoryGirl.create(:restaurant_system)
      put :update, id: restaurant_system.id, restaurant_system: { name:restaurant_system.name, address:restaurant_system.address, phone:restaurant_system.phone }, format: 'json'
      response.should have_http_status(:ok)
  	end

  	it 'restaurant_system not success' do
  	  restaurant_system = FactoryGirl.create(:restaurant_system)
      put :update, id: restaurant_system.id, restaurant_system: { name:'', address:'', phone:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
  	end
  end

  context 'DELETE' do
  	it 'restaurant_system success' do
  	  restaurant_system = FactoryGirl.create(:restaurant_system)
      delete :destroy, id: restaurant_system.id, format: 'json'
      response.should have_http_status(:ok)
  	end
  end
end
