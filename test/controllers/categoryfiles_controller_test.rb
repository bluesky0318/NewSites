require 'test_helper'

class CategoryfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoryfile = categoryfiles(:one)
  end

  test "should get index" do
    get categoryfiles_url
    assert_response :success
  end

  test "should get new" do
    get new_categoryfile_url
    assert_response :success
  end

  test "should create categoryfile" do
    assert_difference('Categoryfile.count') do
      post categoryfiles_url, params: { categoryfile: { categoryfileorder: @categoryfile.categoryfileorder, categoryfilestring: @categoryfile.categoryfilestring } }
    end

    assert_redirected_to categoryfile_url(Categoryfile.last)
  end

  test "should show categoryfile" do
    get categoryfile_url(@categoryfile)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoryfile_url(@categoryfile)
    assert_response :success
  end

  test "should update categoryfile" do
    patch categoryfile_url(@categoryfile), params: { categoryfile: { categoryfileorder: @categoryfile.categoryfileorder, categoryfilestring: @categoryfile.categoryfilestring } }
    assert_redirected_to categoryfile_url(@categoryfile)
  end

  test "should destroy categoryfile" do
    assert_difference('Categoryfile.count', -1) do
      delete categoryfile_url(@categoryfile)
    end

    assert_redirected_to categoryfiles_url
  end
end
