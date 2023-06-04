ActiveAdmin.register Book do

  permit_params :name, :year, :library_id, :author_ids, :genre_ids

  filter :name
  filter :year
  filter :library_card
  filter :library

  show do
    attributes_table do
      row :name
      row :year
      row :library
    end
  end

  index do
    selectable_column
    column :id
    column :name
    column :year
    column :library
    actions
  end

  form do |f|
    f.inputs 'Book' do
      f.input :name
      f.input :year
      f.input :library
    end
    f.actions
  end
  
end
