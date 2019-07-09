require 'test_helper'

class CategoryprojectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoryproject = categoryprojects(:one)
  end

  test "should get index" do
    get categoryprojects_url
    assert_response :success
  end

  test "should get new" do
    get new_categoryproject_url
    assert_response :success
  end

  test "should create categoryproject" do
    assert_difference('Categoryproject.count') do
      post categoryprojects_url, params: { categoryproject: { categoryprojectorder: @categoryproject.categoryprojectorder, categoryprojectstring: @categoryproject.categoryprojectstring } }
    end

    assert_redirected_to categoryproject_url(Categoryproject.last)
  end

  test "should show categoryproject" do
    get categoryproject_url(@categoryproject)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoryproject_url(@categoryproject)
    assert_response :success
  end

  test "should update categoryproject" do
    patch categoryproject_url(@categoryproject), params: { categoryproject: { categoryprojectorder: @categoryproject.categoryprojectorder, categoryprojectstring: @categoryproject.categoryprojectstring } }
    assert_redirected_to categoryproject_url(@categoryproject)
  end

  test "should destroy categoryproject" do
    assert_difference('Categoryproject.count', -1) do
      delete categoryproject_url(@categoryproject)
    end

    assert_redirected_to categoryprojects_url
  end
end
