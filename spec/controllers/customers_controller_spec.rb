require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  context 'GET' do
    it 'all success' do
	    get :index, format: 'json'
	    response.should have_http_status(:ok)
	  end

	  it 'customer success' do
	    customer= FactoryGirl.create(:customer)
	    get :show, id: customer.id, format: 'json'
	    response.should have_http_status(:ok)
	  end
  end

  context 'POST' do
    it 'customer success' do
      customer = FactoryGirl.create(:customer)
      restaurant_system = FactoryGirl.create(:restaurant_system)
      post :create, customer: { name:customer.name, address:customer.address, phone:customer.phone, no_of_people:customer.no_of_people, restaurant_system_id:restaurant_system.id }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'customer not success' do
      post :create, customer: { name:'', address:'', phone:'', no_of_people:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end	
  end
  
  context 'PUT' do
  	it 'customer success' do
  	  customer = FactoryGirl.create(:customer)
      put :update, id: customer.id, customer: { name:customer.name, address:customer.address, phone:customer.phone, no_of_people:customer.no_of_people }, format: 'json'
      response.should have_http_status(:ok)
  	end

  	it 'customer not success' do
  	  customer = FactoryGirl.create(:customer)
      put :update, id: customer.id, customer: { name:'', address:'', phone:'', no_of_people:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
  	end
  end

  context 'DELETE' do
  	it 'customer success' do
  	  customer = FactoryGirl.create(:customer)
      delete :destroy, id: customer.id, format: 'json'
      response.should have_http_status(:ok)
  	end
  end
end
