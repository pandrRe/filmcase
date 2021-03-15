require 'test_helper'

class DirectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get all directors" do
    get directors_url
    assert_equal Director.all.to_json, @response.body
  end

  test "should create director" do
    @body = {
      director: {
        name: "Nametest",
        surname: "Surnametest",
      }
    }
    post directors_url, params: @body, as: :json, xhr: true
    assert_equal Director.last.to_json, @response.body
    assert_equal Director.last.name, "Nametest"
  end

end
