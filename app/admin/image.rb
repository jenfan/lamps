# encoding: utf-8
ActiveAdmin.register Image do
  menu :label => "Фото",:priority => 16
  index do
    selectable_column
    column "Фото кадра", :Lent_img do |lent|
      image_tag Lent.find(lent.lent_id).image_thumb, size:"40x40" if Lent.find(lent.lent_id)
    end
    column "Название кадра", :Lent_name, :max_width => "300px" do |lent|
      Lent.find(lent.lent_id).name if Lent.find(lent.lent_id) 
    end
    column "Фото",:image do |image|
      image_tag image.image_full, size: "70x70"
    end
    actions
  end
  
  coll = Lent.where(is_main: false)+Lent.where(is_main:true,is_collection:false)
  coll = coll.map {|x| x if x.images(true).empty?}.compact || coll
  

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
