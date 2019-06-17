require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before :each do
    @category = assign(:category, Category.create!(title: "bi", image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg')))
    @category1 = assign(:category, Category.create!(title: "ba" , image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg')))


    @category.catalogs = assign(:catalog, [Catalog.create!(title: "yo", location: "nooooo", phone_number: 88005553535,description: "tyt chot e", address: "Kiev", photos:[Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg'),
                                                                                                                                                                          Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg')], category: @category),
                                           Catalog.create!(title: "yo1", location: "nooooo", phone_number: 88005553535,description: "tyt chot e", address: "Kiev",photos:[Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg'),
                                                                                                                                                                          Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg')], category: @category)])
  end


  it "should mark the first catalog.approved to true" do
    @category.catalogs[0].update(approved: true)
    expect(@category.catalogs[0].approved).to_not eq(false)
  end

  it "should mark the second catalog.approved to true" do
    @category.catalogs[1].update(approved: true)
    expect(@category.catalogs[1].approved).to_not eq(false)
  end

  #gowno test
  it "should show a first catalogs title" do
    render
    expect(@category.catalogs[0].title).to eq('yo')
    expect(rendered).to_not include 'yo'
  end

  #gowno test
  it "should show a second catalogs title" do
    render
    expect(@category.catalogs[1].title).to eq('yo1')
    expect(rendered).to_not include 'yo1'
  end
end
