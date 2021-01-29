require 'test_helper'

class ItemimagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itemimage = itemimages(:one)
  end

  test "should get index" do
    get itemimages_url, as: :json
    assert_response :success
  end

  test "should create itemimage" do
    assert_difference('Itemimage.count') do
      post itemimages_url, params: { itemimage: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show itemimage" do
    get itemimage_url(@itemimage), as: :json
    assert_response :success
  end

  test "should update itemimage" do
    patch itemimage_url(@itemimage), params: { itemimage: {  } }, as: :json
    assert_response 200
  end

  test "should destroy itemimage" do
    assert_difference('Itemimage.count', -1) do
      delete itemimage_url(@itemimage), as: :json
    end

    assert_response 204
  end
end
