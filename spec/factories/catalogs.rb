FactoryBot.define do
  factory :catalog do
    title {"aaaaa"}
    location {"nooooo"}
    # category {FactoryBot.create(:category)}
    phone_number {88005553535}
    description {"tyt chot e"}
    # photos { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg') }
    address {"Kiev"}
    approved {true}
  end
end
