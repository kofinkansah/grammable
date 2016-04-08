require 'rails_helper'

RSpec.describe GramsController, type: :controller do
 # when user's web browser performs a GET HTTP request to a URL that looks like "/" (index page)
 # they should get a successful HTTP response from our application 
 # this tests for both the controller ('grams') action (:index) and route
 describe "GET grams#index action" do
  it "should successfully show the page" do
    get :index
    expect(response).to have_http_status(:success)
  end

 end


end
