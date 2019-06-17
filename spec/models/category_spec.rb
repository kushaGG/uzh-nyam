require 'rails_helper'

RSpec.describe Category, type: :model do
  # let!(:category){create(:category)}
  context "association" do
    it { should have_many(:catalogs) }
  end

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to_not be_valid
    end
  end
end
