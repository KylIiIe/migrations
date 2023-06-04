ActiveAdmin.register Genre do

  permit_params :name

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
    f.inputs 'Genre' do
      f.input :name
    end
    f.actions
  end
  
end
