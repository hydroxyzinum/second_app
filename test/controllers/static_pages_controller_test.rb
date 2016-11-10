require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get help" do
    get help_url
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

  test "should get carrier" do
    get carrier_path
    assert_response :success
  end

  test "should get contact" do
    get contact_path
    assert_response :success
  end

  test "should get partners" do
    get partners_path
    assert_response :success
  end

  test "should get blog" do
    get blog_path
    assert_response :success
  end
end