require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                       email: "test123,com",
                                       password: "123",
                                       password_confirmation: "345" } }
    end
    assert_template 'users/new'
  end

  test "valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Example User",
                                         email: "user@example.com",
                                         password: "test123",
                                         password_confirmation: "test123" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
