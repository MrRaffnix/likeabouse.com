ActiveAdmin.register Post do
  menu :priority => 1
  
  scope :all
  
  index do
    column :name
    column :description
    column :link
    column :category
    column :author
    default_actions
  end
  
  form do |f|
    f.inputs "Post Details" do
      f.input :link, :required => true
      f.input :name, :required => true
      f.input :description, :required => true
      f.input :category, :required => true
      f.input :author, :required => true, :collection => Hash[AdminUser.all.map{|u| [u.email,u.id]}]
    end
    f.buttons
  end
end
