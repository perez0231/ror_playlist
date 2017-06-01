require 'test_helper'

class PlaylistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get playlist_index_url
    assert_response :success
  end

  test "should get create" do
    get playlist_create_url
    assert_response :success
  end

  test "should get show" do
    get playlist_show_url
    assert_response :success
  end

  test "should get edit" do
    get playlist_edit_url
    assert_response :success
  end

  test "should get update" do
    get playlist_update_url
    assert_response :success
  end

  test "should get destroy" do
    get playlist_destroy_url
    assert_response :success
  end

end
