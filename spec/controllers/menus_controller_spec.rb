require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  context 'GET' do
    it 'all success' do
  	  get :index, format: 'json'
  	  response.should have_http_status(:ok)
  	end

  	it 'menu success' do
  	  menu= FactoryGirl.create(:menu)
  	  get :show, id: menu.id, format: 'json'
  	  response.should have_http_status(:ok)
  	end
  end

  context 'POST' do
    it 'menu success' do
      menu = FactoryGirl.create(:menu)
      restaurant_system = FactoryGirl.create(:restaurant_system)
      customer = FactoryGirl.create(:customer, restaurant_system_id:restaurant_system.id)
      post :create, menu: { dish_name:menu.dish_name, dish_description:menu.dish_description, dish_price:menu.dish_price, customer_id: customer.id }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'menu not success' do
      post :create, menu: { dish_name:'', dish_description:'', dish_price:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end	
  end
  
  context 'PUT' do
  	it 'menu success' do
  	  menu = FactoryGirl.create(:menu)
      put :update, id: menu.id, menu: { dish_name:menu.dish_name, dish_description:menu.dish_description, dish_price:menu.dish_price }, format: 'json'
      response.should have_http_status(:ok)
  	end

  	it 'menu not success' do
  	  menu = FactoryGirl.create(:menu)
      put :update, id: menu.id, menu: { dish_name:'', dish_description:'', dish_price:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
  	end
  end

  context 'DELETE' do
  	it 'menu success' do
  	  menu = FactoryGirl.create(:menu)
      delete :destroy, id: menu.id, format: 'json'
      response.should have_http_status(:ok)
  	end
  end
end
