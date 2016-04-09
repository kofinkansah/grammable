require 'rails_helper'

RSpec.describe GramsController, type: :controller do
 # when user's web browser performs a GET HTTP request to a URL that looks like "/" (index page)
 # they should get a successful HTTP response from our application 
 # this tests for both the controller ('grams') action (:index) and route
 describe "GET grams#index action" do
  it "should successfully show the index page" do
    get :index
    expect(response).to have_http_status(:success)
  end
 end

 # for a GET HTTP request that look like /grams/new
 describe "GET grams#new action" do
  it "should successfully show the new form page" do
    get :new
    expect(response).to have_http_status(:success)
  end
end

  # for POST HTTP request to /grams
  describe "POST grams#create action" do
    it "should successfully create a new gram in our database" do
      post :create, gram: { message: 'Hello!' }
      expect(response).to redirect_to root_path
    
      gram = Gram.last
      expect(gram.message).to eq('Hello!')
    end
  end


end # end for RSpec.describe GramsController, type: :controller do
