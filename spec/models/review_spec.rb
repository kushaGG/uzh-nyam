require 'rails_helper'

RSpec.describe Review, type: :model do
  let!(:user){create(:user)}

  subject{
     build(:review, user: user)
  }
  it {  subject
    should validate_presence_of(:comment)}
  it {  subject
  should validate_presence_of(:rating)}



  context "association" do
    it { should belong_to(:user) }
    it { should belong_to(:catalog) }
  end
end
