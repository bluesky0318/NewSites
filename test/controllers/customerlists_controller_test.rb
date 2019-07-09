require 'test_helper'

class CustomerlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customerlist = customerlists(:one)
  end

  test "should get index" do
    get customerlists_url
    assert_response :success
  end

  test "should get new" do
    get new_customerlist_url
    assert_response :success
  end

  test "should create customerlist" do
    assert_difference('Customerlist.count') do
      post customerlists_url, params: { customerlist: { companydescription: @customerlist.companydescription, companyname: @customerlist.companyname, customerorder: @customerlist.customerorder, engineeremail: @customerlist.engineeremail } }
    end

    assert_redirected_to customerlist_url(Customerlist.last)
  end

  test "should show customerlist" do
    get customerlist_url(@customerlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_customerlist_url(@customerlist)
    assert_response :success
  end

  test "should update customerlist" do
    patch customerlist_url(@customerlist), params: { customerlist: { companydescription: @customerlist.companydescription, companyname: @customerlist.companyname, customerorder: @customerlist.customerorder, engineeremail: @customerlist.engineeremail } }
    assert_redirected_to customerlist_url(@customerlist)
  end

  test "should destroy customerlist" do
    assert_difference('Customerlist.count', -1) do
      delete customerlist_url(@customerlist)
    end

    assert_redirected_to customerlists_url
  end
end
