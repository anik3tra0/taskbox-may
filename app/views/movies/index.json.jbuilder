json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :language, :date_watched, :poster_url
  json.url movie_url(movie, format: :json)
end
