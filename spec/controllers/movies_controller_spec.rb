require 'rails_helper'
require 'spec_helper'

describe MoviesController do
  it 'deletes a new movie' do
      movie = Movie.create(:title => "Kaala")
      delete :destroy, :id => movie.id
      expect{Movie.find(movie.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
  