require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teachers_index_url
    assert_response :success
  end

  test "should get show" do
    get teachers_show_url
    assert_response :success
  end

  test "should get new" do
    get teachers_new_url
    assert_response :success
  end

  test "should get edit" do
    get teachers_edit_url
    assert_response :success
  end

  test "should get update" do
    get teachers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get teachers_destroy_url
    assert_response :success
  end

end
