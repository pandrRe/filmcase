require 'test_helper'

class DirectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get all directors" do
    get directors_url
    assert_equal Director.all.to_json, @response.body
  end

end
