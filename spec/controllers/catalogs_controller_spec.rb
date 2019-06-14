require 'rails_helper'

RSpec.describe CatalogsController, type: :controller do



  describe "GET #new" do
    it "open the form to create" do
      # FactoryBot.create(:catalog)
      # build(:catalog, title: "aaaaa", location: "Kiev")
      get :new
      # expect(subject.catalog_url.title).to eq("aaaaa")
      # assigns(:catalogs).should eq("aaaaa")
      expect(response).to have_http_status(200)
    end
  end


  describe 'POST #create' do
    it "should create catalog and refresh the page" do
      post :create, params: {catalog: {title:"aaaaa"}}
      # expect(subject.catalog_url.title).to eq("aaaaa")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #index" do
    it ' show a list of all catalog' do
      total1 = Catalog.all.count

      get :index
      expect(total1).to eq(0)
    expect(response).to have_http_status(200)
  end
  end

  # describe "GET #show" do
  #   it ' show a list of all catalog' do
  #     get :show
  #   expect(response).to have_http_status(200)
  # end
  # end
  # describe 'GET #edit' do
  #   it "open form for edit category" do
  #     get :edit, params: {id:subject.catalog_url.id }
  #     expect(response).to have_http_status(200)
  #   end
  # end

end
