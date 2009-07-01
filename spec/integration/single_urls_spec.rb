require File.dirname(__FILE__) + '/../spec_helper.rb'

# describe 'SingleUrls' do
#   
#   describe "description" do
#     it "should description" do
#       visit '/'
#     end
#   end
#   
# end

class SignupTest < ActionController::IntegrationTest

  def test_trial_account_sign_up
    visit '/'
    click_link "Sign up"
    fill_in "Email", :with => "good@example.com"
    select "Free account"
    click_button "Register"
  end

end