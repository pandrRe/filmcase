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

  test "should update film" do
    film = films(:one)
    @body = {
      film: {
        title: "Updated Title",
        year: film.year,
        synopsis: film.synopsis,
        director_id: film.director_id,
        rating: film.rating,
        url: film.url
      }
    }
    put film_url(film.id), params: @body, as: :json, xhr: true
    assert_equal JSON[@response.body]['title'], "Updated Title"

    film = Film.find(film.id)
    assert_equal film.title, "Updated Title"
  end

  test "should delete film" do
    film = films(:two)
    delete film_url(film.id), xhr: true
    assert_equal JSON[@response.body]['id'], film.id

    assert !Film.where(:id => film.id).exists?
  end

end
