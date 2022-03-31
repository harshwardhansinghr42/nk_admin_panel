require "application_system_test_case"

class ProductCommentsTest < ApplicationSystemTestCase
  setup do
    @product_comment = product_comments(:one)
  end

  test "visiting the index" do
    visit product_comments_url
    assert_selector "h1", text: "Product comments"
  end

  test "should create product comment" do
    visit product_comments_url
    click_on "New product comment"

    fill_in "Comment", with: @product_comment.comment
    fill_in "Product", with: @product_comment.product_id
    fill_in "User", with: @product_comment.user_id
    click_on "Create Product comment"

    assert_text "Product comment was successfully created"
    click_on "Back"
  end

  test "should update Product comment" do
    visit product_comment_url(@product_comment)
    click_on "Edit this product comment", match: :first

    fill_in "Comment", with: @product_comment.comment
    fill_in "Product", with: @product_comment.product_id
    fill_in "User", with: @product_comment.user_id
    click_on "Update Product comment"

    assert_text "Product comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Product comment" do
    visit product_comment_url(@product_comment)
    click_on "Destroy this product comment", match: :first

    assert_text "Product comment was successfully destroyed"
  end
end
