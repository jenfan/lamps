ActiveAdmin.register Image do
  menu :label => "Images",:priority => 2, :parent => "Lents"
  index do
    column :Lent_name do |lent|
      Lent.find(lent.lent_id).name if Lent.find(lent.lent_id) 
    end
    column :Lent_img do |lent|
      image_tag Lent.find(lent.lent_id).image_thumb, size:"30x30" if Lent.find(lent.lent_id)
    end
    column :image do |image|
      image_tag image.image_full, size: "50x50"
    end
    actions
  end
  
  coll = Lent.where(is_main: false)+Lent.where(is_main:true,is_collection:false)
  coll = coll.map {|x| x if x.images(true).size==0}.compact || coll
  

  form do |f| 
  f.inputs "Images" do
    f.input :lent_id, :as => :select, :collection => coll.collect {|u| [u.name, u.id]}, :include_blank => false
    f.input :image_full
    end
    f.actions
  end
  
  show do
    h4 "full"
    div do
      image_tag image.image_full
    end
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :id, :lent_id, :image_full
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
