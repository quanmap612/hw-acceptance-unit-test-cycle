Given(/^the following movies exist:$/) do |movies_table|
  movies_table.hashes.each do |movie_hash|
    Movie.create movie_hash
  end
end
# Given /the following movies exist/ do |movies_table|
#   movies_table.hashes.each do |movie|
#     Movie.create movie
#   end
# end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end


Then(/^the director of "(.+)" should be "(.+)"/) do |title, director|
  movie = Movie.find_by(title: title)
  expect(director).to eq(movie.director)
end

Then(/^the rating of "(.+)" should be "(.+)"/) do |title, rating|
  movie = Movie.find_by(title: title)
  expect(rating).to eq(movie.rating)
end

When(/^I choose "([^"]*)" in "([^"]*)" as release date$/) do |value, select_label|
  select_date value, from: select_label
end
