require 'rails_helper'

RSpec.describe Catalog, type: :model do
  context "association" do
    it { should belong_to(:category) }
    it { should have_many(:reviews) }
  end
end
