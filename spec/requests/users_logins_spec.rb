require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  include SessionsHelper
  
  let(:user) { create(:user) }
  
  describe "GET /login" do
    context "invalid information" do
      it "fails having a danger flash messagae" do
      get login_path
      post login_path, params: {
        session: {
          email: "",
          password: ""
        }
      }
      expect(flash[:danger]).to be_truthy
      expect(is_logged_in?).to be_falsey
      end
    end
  end
  
  context "valid information" do
    it "succeeds having no danger flash messagae" do
    get login_path
    post login_path, params: {
      session: {
        email: user.email,
        password: user.password
      }
    }
    expect(flash[:danger]).to be_falsey
    expect(is_logged_in?).to be_truthy
    end
  end
  
    it "succeeds login and logout" do
      get login_path
      post login_path, params: {
        session: {
          email: user.email,
          password: user.password
        }
      }
      expect(is_logged_in?).to be_truthy
      delete logout_path
      expect(is_logged_in?).to be_falsey
    end
end
