require 'test_helper'

class BugreasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bugreason = bugreasons(:one)
  end

  test "should get index" do
    get bugreasons_url
    assert_response :success
  end

  test "should get new" do
    get new_bugreason_url
    assert_response :success
  end

  test "should create bugreason" do
    assert_difference('Bugreason.count') do
      post bugreasons_url, params: { bugreason: { bugdescriptionstring: @bugreason.bugdescriptionstring, bugorder: @bugreason.bugorder } }
    end

    assert_redirected_to bugreason_url(Bugreason.last)
  end

  test "should show bugreason" do
    get bugreason_url(@bugreason)
    assert_response :success
  end

  test "should get edit" do
    get edit_bugreason_url(@bugreason)
    assert_response :success
  end

  test "should update bugreason" do
    patch bugreason_url(@bugreason), params: { bugreason: { bugdescriptionstring: @bugreason.bugdescriptionstring, bugorder: @bugreason.bugorder } }
    assert_redirected_to bugreason_url(@bugreason)
  end

  test "should destroy bugreason" do
    assert_difference('Bugreason.count', -1) do
      delete bugreason_url(@bugreason)
    end

    assert_redirected_to bugreasons_url
  end
end
