ActiveAdmin.register Category, as: 'Bousategory' do
  menu priority: 2

  index do
    column :rank
    column :name
    column :description
    column :created_at
    column :updated_at
    default_actions
  end
end