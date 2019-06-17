ActiveAdmin.register Catalog do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :title, :location, :phone_number, :open_time_monday, :open_time_tuesday, :open_time_wednesday,
              :open_time_thursday, :open_time_friday, :open_time_saturday, :open_time_sunday, :close_time_monday,
              :close_time_tuesday, :close_time_wednesday, :close_time_thursday, :close_time_friday, :close_time_saturday,
              :close_time_sunday, :description, :address, :has_free_wifi, :category_id, :approved, photos: []

form html: { multipart: true } do |f|
   f.semantic_errors

   f.inputs do
     f.input :title
     f.input :category_id, :label => "Category", :as => :select, :collection => Category.all.map{|u| ["#{u.title}", u.id]}
     f.input :location
     f.input :phone_number
     f.input :open_time_monday
     f.input :close_time_monday
     f.input :open_time_tuesday
     f.input :close_time_tuesday
     f.input :open_time_wednesday
     f.input :close_time_wednesday
     f.input :open_time_thursday
     f.input :close_time_thursday
     f.input :open_time_friday
     f.input :close_time_friday
     f.input :open_time_saturday
     f.input :close_time_saturday
     f.input :open_time_sunday
     f.input :close_time_sunday
     f.input :description
     f.input :address
     f.input :photos, as: :file, input_html: { multiple: true }
     f.input :has_free_wifi
     f.input :approved
   end
   actions
 end
end
