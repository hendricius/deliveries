require "test_helper"

describe DriversController do

  let(:driver) { drivers :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates driver" do
    assert_difference('Driver.count') do
      post :create, driver: { address: driver.address, company_id: driver.company_id, current_capacity: driver.current_capacity, latitude: driver.latitude, longitude: driver.longitude, max_capacity: driver.max_capacity, name: driver.name, phone: driver.phone }
    end

    assert_redirected_to driver_path(assigns(:driver))
  end

  it "shows driver" do
    get :show, id: driver
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: driver
    assert_response :success
  end

  it "updates driver" do
    put :update, id: driver, driver: { address: driver.address, company_id: driver.company_id, current_capacity: driver.current_capacity, latitude: driver.latitude, longitude: driver.longitude, max_capacity: driver.max_capacity, name: driver.name, phone: driver.phone }
    assert_redirected_to driver_path(assigns(:driver))
  end

  it "destroys driver" do
    assert_difference('Driver.count', -1) do
      delete :destroy, id: driver
    end

    assert_redirected_to drivers_path
  end

end
