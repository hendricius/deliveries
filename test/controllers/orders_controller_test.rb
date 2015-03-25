require "test_helper"

describe OrdersController do

  let(:order) { orders :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates order" do
    assert_difference('Order.count') do
      post :create, order: { address: order.address, capacity: order.capacity, company_id: order.company_id, content: order.content, driver_id: order.driver_id, latitude: order.latitude, longitude: order.longitude }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  it "shows order" do
    get :show, id: order
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: order
    assert_response :success
  end

  it "updates order" do
    put :update, id: order, order: { address: order.address, capacity: order.capacity, company_id: order.company_id, content: order.content, driver_id: order.driver_id, latitude: order.latitude, longitude: order.longitude }
    assert_redirected_to order_path(assigns(:order))
  end

  it "destroys order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: order
    end

    assert_redirected_to orders_path
  end

end
