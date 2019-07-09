require 'test_helper'

class OsplatformsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @osplatform = osplatforms(:one)
  end

  test "should get index" do
    get osplatforms_url
    assert_response :success
  end

  test "should get new" do
    get new_osplatform_url
    assert_response :success
  end

  test "should create osplatform" do
    assert_difference('Osplatform.count') do
      post osplatforms_url, params: { osplatform: { categoryproject_id: @osplatform.categoryproject_id, osdescribe: @osplatform.osdescribe, osorder: @osplatform.osorder } }
    end

    assert_redirected_to osplatform_url(Osplatform.last)
  end

  test "should show osplatform" do
    get osplatform_url(@osplatform)
    assert_response :success
  end

  test "should get edit" do
    get edit_osplatform_url(@osplatform)
    assert_response :success
  end

  test "should update osplatform" do
    patch osplatform_url(@osplatform), params: { osplatform: { categoryproject_id: @osplatform.categoryproject_id, osdescribe: @osplatform.osdescribe, osorder: @osplatform.osorder } }
    assert_redirected_to osplatform_url(@osplatform)
  end

  test "should destroy osplatform" do
    assert_difference('Osplatform.count', -1) do
      delete osplatform_url(@osplatform)
    end

    assert_redirected_to osplatforms_url
  end
end
