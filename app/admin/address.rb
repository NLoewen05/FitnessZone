ActiveAdmin.register Address do
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

permit_params :country, :province_id, :postalCode, :city, :phone, :address_line, :address_type_id, :user_id

form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :country
      f.input :province
      f.input :postalCode
      f.input :city
      f.input :phone
      f.input :address_line
      f.input :address_type
      f.input :user
    end
    f.actions
  end

end
