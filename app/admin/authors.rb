ActiveAdmin.register Author do

  permit_params :name, :birthdate

  filter :name

  show do
    attributes_table do
      row :name
    end
  end

  index do
    selectable_column
    column :id
    column :name
    actions
  end

  form do |f|
    f.inputs 'Author' do
      f.input :name
    end
    f.actions
  end
  
end
