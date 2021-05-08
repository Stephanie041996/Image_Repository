require "test_helper"

class ImgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @img = imgs(:one)
  end

  test "should get index" do
    get imgs_url
    assert_response :success
  end

  test "should get new" do
    get new_img_url
    assert_response :success
  end

  test "should create img" do
    assert_difference('Img.count') do
      post imgs_url, params: { img: { caption: @img.caption } }
    end

    assert_redirected_to img_url(Img.last)
  end

  test "should show img" do
    get img_url(@img)
    assert_response :success
  end

  test "should get edit" do
    get edit_img_url(@img)
    assert_response :success
  end

  test "should update img" do
    patch img_url(@img), params: { img: { caption: @img.caption } }
    assert_redirected_to img_url(@img)
  end

  test "should destroy img" do
    assert_difference('Img.count', -1) do
      delete img_url(@img)
    end

    assert_redirected_to imgs_url
  end
end
