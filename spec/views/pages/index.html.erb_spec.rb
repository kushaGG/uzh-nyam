require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before :each do
    @categories = assign(:category, [Category.create!(title: "bi", image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg')),
                                     Category.create!(title: "ba", image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg')),
                                     Category.create!(title: "bo", image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg'))])
  end

  it "should render first category title" do
    render
    expect(@categories[0].title).to eq('bi')
    expect(rendered).to include 'bi'
  end

  it "should render second category title" do
    render
    expect(@categories[1].title).to eq('ba')
    expect(rendered).to include 'ba'
  end

  it "should render third category title" do
    render
    expect(@categories[2].title).to eq('bo')
    expect(rendered).to include 'bo'
  end
end
