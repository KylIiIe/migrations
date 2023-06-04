ActiveAdmin.register Library do
  permit_params :name, :city, :year_of_creation, :street, :zip_code

  filter :name
  filter :year_of_creation
  filter :city
  filter :street
  filter :zip_code


  show do
    attributes_table do
      row :id
      row :name
      row :year_of_creation
      row :city
      row :street
      row :zip_code
    end
  end

  index do
    selectable_column
    column :id
    column :name
    column :year_of_creation
    column :city
    column :street
    column :zip_code
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'Library' do
      f.input :name
      f.input :year_of_creation
      f.input :city
      f.input :street
      f.input :zip_code
    end
    f.actions
  end
end
