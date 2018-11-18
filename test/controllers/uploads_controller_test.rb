require 'test_helper'

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get direct_upload" do
    get uploads_direct_upload_url
    assert_response :success
  end

end
