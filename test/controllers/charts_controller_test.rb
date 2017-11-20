require 'test_helper'

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get downloads_by_day" do
    get charts_downloads_by_day_url
    assert_response :success
  end

end
