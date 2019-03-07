Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  #map similar_movie to call similar method in controller
  get '/movies/:id/similar', to: 'movies#similar',as: 'similar_movie'
end
