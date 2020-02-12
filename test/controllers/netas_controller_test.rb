require 'test_helper'

class NetasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get netas_index_url
    assert_response :success
  end

end
