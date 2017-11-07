ActiveAdmin.register User do
  permit_params :username, :email, :firstName, :lastName, :email, :password
end

