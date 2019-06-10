require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let!(:user) { build(:user, email: "test@gmail.com") }
  login_user


it "should have a current_user" do
  expect(subject.current_user).to_not eq(nil)
end

end
