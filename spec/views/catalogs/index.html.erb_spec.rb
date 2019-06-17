require 'rails_helper'

RSpec.describe "catalogs/index", type: :view do
  before :each do
    @category = assign(:category, Category.create!(title: "bi", image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg')))


    @catalogs = assign(:catalog, [Catalog.create!(title: "yo", location: "nooooo", phone_number: 88005553535,description: "tyt chot e", address: "Kiev", photos:[Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg'),
                                                                                                                                                                 Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image2.jpg'), 'image/jpeg')], category: @category),
                                 Catalog.create!(title: "yo1", location: "nooooo", phone_number: 88005553535,description: "tyt chot e", address: "Kiev", photos:[Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg'),
                                                                                                                                                                 Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image2.jpg'), 'image/jpeg')], category: @category)])
  end

  it "should show a count catalogs" do
    render
    expect(@catalogs.count).to eq(2)
    expect(rendered).to include '2'
  end

  it "should show a first catalogs title" do
    render
    expect(@catalogs[0].title).to eq('yo')
    expect(rendered).to include 'yo'
  end

  it "should show a first catalog photos" do
    render
    expect(rendered).to include '<img src="/uploads/catalog/photos/1/logo_image.jpg" alt="Logo image" width="300" height="200" />'
    expect(rendered).to include '<img src="/uploads/catalog/photos/1/logo_image2.jpg" alt="Logo image2" width="300" height="200" />'
  end

  it "should show a second catalogs title" do
    render
    expect(@catalogs[1].title).to eq('yo1')
    expect(rendered).to include 'yo1'
  end

  it "should show a first catalog photos" do
    render
    expect(rendered).to include '<img src="/uploads/catalog/photos/2/logo_image.jpg" alt="Logo image" width="300" height="200" />'
    expect(rendered).to include '<img src="/uploads/catalog/photos/2/logo_image2.jpg" alt="Logo image2" width="300" height="200" />'
  end

  it "should show a first catalog category title" do
    render
    expect(@catalogs[0].category.title).to eq('bi')
    expect(rendered).to include 'bi'
  end

  it "should show a second catalog category title" do
    render
    expect(@catalogs[1].category.title).to eq('bi')
    expect(rendered).to include 'bi'
  end

  it "should show a links to catalogs" do
    render
    expect(rendered).to include '<a href="/catalogs/1/edit">yo</a>'
    expect(rendered).to include '<a href="/catalogs/2/edit">yo1</a>'
  end

  it "should a first catalog before create var approved to not equal true" do
    expect(@catalogs[0].approved).to_not eq(true)
  end

  it "should a second catalog before create var approved to not equal true" do
    expect(@catalogs[1].approved).to_not eq(true)
  end
end
