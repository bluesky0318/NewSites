require 'test_helper'

class HwplatformsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hwplatform = hwplatforms(:one)
  end

  test "should get index" do
    get hwplatforms_url
    assert_response :success
  end

  test "should get new" do
    get new_hwplatform_url
    assert_response :success
  end

  test "should create hwplatform" do
    assert_difference('Hwplatform.count') do
      post hwplatforms_url, params: { hwplatform: { hwcode: @hwplatform.hwcode, hwdescription: @hwplatform.hwdescription, hwmajorversion: @hwplatform.hwmajorversion, hwminorversion: @hwplatform.hwminorversion, hwnickname: @hwplatform.hwnickname, hworder: @hwplatform.hworder } }
    end

    assert_redirected_to hwplatform_url(Hwplatform.last)
  end

  test "should show hwplatform" do
    get hwplatform_url(@hwplatform)
    assert_response :success
  end

  test "should get edit" do
    get edit_hwplatform_url(@hwplatform)
    assert_response :success
  end

  test "should update hwplatform" do
    patch hwplatform_url(@hwplatform), params: { hwplatform: { hwcode: @hwplatform.hwcode, hwdescription: @hwplatform.hwdescription, hwmajorversion: @hwplatform.hwmajorversion, hwminorversion: @hwplatform.hwminorversion, hwnickname: @hwplatform.hwnickname, hworder: @hwplatform.hworder } }
    assert_redirected_to hwplatform_url(@hwplatform)
  end

  test "should destroy hwplatform" do
    assert_difference('Hwplatform.count', -1) do
      delete hwplatform_url(@hwplatform)
    end

    assert_redirected_to hwplatforms_url
  end
end
