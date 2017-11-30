ActiveAdmin.register User do
  permit_params :username, :email, :firstName, :lastName, :email, :password, :address_id

  index do
    selectable_column
    id_column
    column :email
    column :username
    column :firstName
    column :lastName
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :username
  filter :firstName
  filter :lastName
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :username
      f.input :firstName
      f.input :lastName
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end

