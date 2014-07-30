ActiveAdmin.register Lent do
  menu :label => "Lenta",:priority => 12
  scope :all_main
  scope :collections
  scope :not_collections
  scope :inside_collections

  index do
    column :id
    column :is_main
    column :collection, :sortable => :main_id do |main|
      image_tag Lent.find_by_id(main.main_id).image_thumb, size: "50x50" if main.main_id
    end
    column :name
    column :is_collection
    column :image_thumb do |image|
      image_tag image.image_thumb, size: "50x50"
    end
    column :images do |lent|
      lent.images.count!=0 ? lent.images.count : ''
    end

    actions
  end
  
  form do |f| 
  f.inputs "Lents" do
    f.input :name
    f.input :is_main
    f.input :is_collection
    f.input :main_id, :as => :select, :collection => Lent.where(is_main: true, is_collection: true).collect {|u| [u.name, u.id]}, :include_blank => true
    f.input :image_thumb
    f.input :image_full
    end
    f.actions
  end

  show do
    h4 "thumb"
    div do
      image_tag lent.image_thumb
    end
    br
    h4 "full"
    div do
      image_tag lent.image_full
    end
  end
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :main_id, :is_main, :name, :image_full, :image_thumb, :is_collection
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
