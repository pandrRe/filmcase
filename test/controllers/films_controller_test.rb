require 'test_helper'

class FilmsControllerTest < ActionDispatch::IntegrationTest
  test "should get all films" do
    get films_url
    assert_equal Film.all.to_json, @response.body
  end

  test "should create film" do
    @body = {
      film: {
        title: "Test Title",
        year: 1999,
        synopsis: "Nice movie.",
        director_id: Director.last.id,
        rating: 5,
        url: "http://test.url/image.png",
      }
    }
    post films_url, params: @body, as: :json, xhr: true
    assert_equal Film.last.to_json, @response.body
    assert_equal Film.last.title, "Test Title"
  end

  test "should fetch film by id" do
    film = films(:one)
    get film_url(film.id)
    assert_equal film.to_json, @response.body
  end

end
