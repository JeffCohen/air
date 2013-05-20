require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  setup do
    @flight = flights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post :create, flight: { arrival_airport_id: @flight.arrival_airport_id, arrives_at: @flight.arrives_at, departs_at: @flight.departs_at, departure_airport_id: @flight.departure_airport_id, duration: @flight.duration, miles: @flight.miles, number: @flight.number, seats: @flight.seats }
    end

    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should show flight" do
    get :show, id: @flight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight
    assert_response :success
  end

  test "should update flight" do
    put :update, id: @flight, flight: { arrival_airport_id: @flight.arrival_airport_id, arrives_at: @flight.arrives_at, departs_at: @flight.departs_at, departure_airport_id: @flight.departure_airport_id, duration: @flight.duration, miles: @flight.miles, number: @flight.number, seats: @flight.seats }
    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should destroy flight" do
    assert_difference('Flight.count', -1) do
      delete :destroy, id: @flight
    end

    assert_redirected_to flights_path
  end
end
