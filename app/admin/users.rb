ActiveAdmin.register User do

  permit_params :name, :email, :password, :password_confirmation

  filter :email
  filter :name

  show do
    attributes_table do
      row :id
      row :email
      row :name
    end
  end

  index do
    selectable_column
    column :id
    column :email
    column :name
    actions
  end

  form do |f|
    f.inputs 'User' do
      f.input :name
      f.input :email

      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  
end
