require 'rails_helper'

RSpec.describe Catalog, type: :model do
#   let!(:category){create(:category)}
#   # create(:category)
# pp  subject{
#      build(:catalog, category: category)
#   }


  context "association" do
    it { should belong_to(:category) }
    it { should have_many(:reviews) }
  end
  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to_not be_valid
    end
  end
end
