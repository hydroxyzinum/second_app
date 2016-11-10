require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = Comment.new(name: "123", body: "345")
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "name should be present" do
    @comment.name = "    "
    assert_not @comment.valid?
  end

  test "body should be present" do
    @comment.body = "    "
    assert_not @comment.valid?
  end

  test "name should have maximum length" do
    @comment.name = "a" * 21
    assert_not @comment.valid?
  end
end
