require 'test_helper'

class CrimesControllerTest < ActionController::TestCase
  setup do
    @crime = crimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crimes)
  end

  test "should create crime" do
    assert_difference('Crime.count') do
      post :create, crime: { code: @crime.code, incidentTime: @crime.incidentTime, lat: @crime.lat, lng: @crime.lng, name: @crime.name, rawDateFormat: @crime.rawDateFormat, reportNumber: @crime.reportNumber, street: @crime.street }
    end

    assert_response 201
  end

  test "should show crime" do
    get :show, id: @crime
    assert_response :success
  end

  test "should update crime" do
    put :update, id: @crime, crime: { code: @crime.code, incidentTime: @crime.incidentTime, lat: @crime.lat, lng: @crime.lng, name: @crime.name, rawDateFormat: @crime.rawDateFormat, reportNumber: @crime.reportNumber, street: @crime.street }
    assert_response 204
  end

  test "should destroy crime" do
    assert_difference('Crime.count', -1) do
      delete :destroy, id: @crime
    end

    assert_response 204
  end
end
