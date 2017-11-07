ActiveAdmin.register Product do
  permit_params :name, :weight, :price, :description, :image, :caption, :product_category_id


# form :html => { :enctype => "multipart/form-data" } do |f|
#    f.inputs "Details" do
#     f.input :name
#     f.input :weight
#     f.input :description
#     f.input :price
#     f.input :caption
#     f.input :image, :as => :file
#   end
#   f.actions
#  end
end
