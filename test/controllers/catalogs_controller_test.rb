require 'test_helper'

class CatalogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catalog = catalogs(:one)
  end

  test "should get index" do
    get catalogs_url
    assert_response :success
  end

  test "should get new" do
    get new_catalog_url
    assert_response :success
  end

  test "should create catalog" do
    assert_difference('Catalog.count') do
      post catalogs_url, params: { catalog: { address: @catalog.address, description: @catalog.description, has_free_wifi: @catalog.has_free_wifi, location: @catalog.location, phone_number: @catalog.phone_number, photos: @catalog.photos, time_friday: @catalog.time_friday, time_monday: @catalog.time_monday, time_saturday: @catalog.time_saturday, time_sunday: @catalog.time_sunday, time_thursday: @catalog.time_thursday, time_tuesday: @catalog.time_tuesday, time_wednesday: @catalog.time_wednesday, title: @catalog.title } }
    end

    assert_redirected_to catalog_url(Catalog.last)
  end

  test "should show catalog" do
    get catalog_url(@catalog)
    assert_response :success
  end

  test "should get edit" do
    get edit_catalog_url(@catalog)
    assert_response :success
  end

  test "should update catalog" do
    patch catalog_url(@catalog), params: { catalog: { address: @catalog.address, description: @catalog.description, has_free_wifi: @catalog.has_free_wifi, location: @catalog.location, phone_number: @catalog.phone_number, photos: @catalog.photos, time_friday: @catalog.time_friday, time_monday: @catalog.time_monday, time_saturday: @catalog.time_saturday, time_sunday: @catalog.time_sunday, time_thursday: @catalog.time_thursday, time_tuesday: @catalog.time_tuesday, time_wednesday: @catalog.time_wednesday, title: @catalog.title } }
    assert_redirected_to catalog_url(@catalog)
  end

  test "should destroy catalog" do
    assert_difference('Catalog.count', -1) do
      delete catalog_url(@catalog)
    end

    assert_redirected_to catalogs_url
  end
end
