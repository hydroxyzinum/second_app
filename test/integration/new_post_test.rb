require 'test_helper'

class NewPostTest < ActionDispatch::IntegrationTest

  def setup
    @post = posts(:one)
  end

  test "adding post with invalid information" do
    get posts_path
    post posts_path params: { post: { title: "",
                                          body: "" } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "adding post with valid information" do
    get posts_path
    post posts_path params: { post: { title: @post.title,
                                      body: @post.body } }
    follow_redirect!
    assert_template 'posts/show'
  end

end
