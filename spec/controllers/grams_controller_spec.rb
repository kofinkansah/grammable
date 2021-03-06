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
  it "should require users to be logged in" do
    get :new
    expect(response).to redirect_to new_user_session_path
  end

  it "should successfully show the new form " do
    user = FactoryGirl.create(:user)
    sign_in user

    get :new
    expect(response).to have_http_status(:success)
  end
end

  # for POST HTTP request to /grams
  describe "POST grams#create action" do
    it "should require users to be logged in" do
      post :create, gram: { message: "Hello" }
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully create a new gram in our database" do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, gram: { message: 'Hello!' }
      expect(response).to redirect_to root_path
    
      gram = Gram.last
      expect(gram.message).to eq('Hello!')
      expect(gram.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = FactoryGirl.create(:user)
      sign_in user

      gram_count = Gram.count
      post :create, gram: { message: '' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(gram_count).to eq Gram.count
    end
  end


end # end for RSpec.describe GramsController, type: :controller do
