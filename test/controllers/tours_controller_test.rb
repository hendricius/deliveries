require "test_helper"

describe ToursController do

  let(:tour) { tours :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tours)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates tour" do
    assert_difference('Tour.count') do
      post :create, tour: { capacityarray: tour.capacityarray, driver_id: tour.driver_id, kind: tour.kind, time: tour.time, tour: tour.tour }
    end

    assert_redirected_to tour_path(assigns(:tour))
  end

  it "shows tour" do
    get :show, id: tour
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: tour
    assert_response :success
  end

  it "updates tour" do
    put :update, id: tour, tour: { capacityarray: tour.capacityarray, driver_id: tour.driver_id, kind: tour.kind, time: tour.time, tour: tour.tour }
    assert_redirected_to tour_path(assigns(:tour))
  end

  it "destroys tour" do
    assert_difference('Tour.count', -1) do
      delete :destroy, id: tour
    end

    assert_redirected_to tours_path
  end

end
