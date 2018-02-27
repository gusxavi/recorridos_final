require 'test_helper'

class BusOperatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_operator = bus_operators(:one)
  end

  test "should get index" do
    get bus_operators_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_operator_url
    assert_response :success
  end

  test "should create bus_operator" do
    assert_difference('BusOperator.count') do
      post bus_operators_url, params: { bus_operator: {  } }
    end

    assert_redirected_to bus_operator_url(BusOperator.last)
  end

  test "should show bus_operator" do
    get bus_operator_url(@bus_operator)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_operator_url(@bus_operator)
    assert_response :success
  end

  test "should update bus_operator" do
    patch bus_operator_url(@bus_operator), params: { bus_operator: {  } }
    assert_redirected_to bus_operator_url(@bus_operator)
  end

  test "should destroy bus_operator" do
    assert_difference('BusOperator.count', -1) do
      delete bus_operator_url(@bus_operator)
    end

    assert_redirected_to bus_operators_url
  end
end
