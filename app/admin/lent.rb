# encoding: utf-8
ActiveAdmin.register Lent do


  menu :label => "Лента",:priority => 12
  scope 'All main slides', :all_main
  scope 'Collections', :collections
  scope 'Slides without collection', :not_collections
  scope 'Slides inside collection',:inside_collections

  filter :main_id, label:"Slides in the collections", as: :check_boxes, collection: proc { Lent.where(is_collection: true) }


  index do
    selectable_column
    column :id
    column "На главной", :is_main
    column "Коллекция", :collection do |main|
      image_tag Lent.find_by_id(main.main_id).image_thumb, size: "50x50" if main.main_id
    end
    column "Имя", :name
    column "Статичная",:image_thumb do |image|
      image_tag image.image_thumb, size: "50x50"
    end
    column "При наводе мыши",:image_full do |image|
      image_tag image.image_full, size: "50x50"
    end
    column "Кол-во фото", :images do |lent|
      lent.images.count!=0 ? lent.images.count : ''
    end
    actions
  end

  show do
    columns do
      column :span => 1 do
        h4 "фото"
        div do
          image_tag lent.image_thumb, size: "300x300"
        end
      end
      column do
        h4 "фото при наведении"
        div do
          image_tag lent.image_full, size: "300x300"
        end
        div do
          link_to 'Удалить фото при наведении', delete_full_admin_lent_path(lent), method: 'delete'
        end
      end
    end
  end
  
  form do |f| 
  f.inputs "Выберите коллкекцию" do
    f.input :main_id, :label => "Коллекция",
     :as => :select, :collection => Lent.where(is_main: true, is_collection: true).collect {|u| [u.name, u.id]}, :include_blank => true
  end
  f.inputs do
    f.input :name, :label => "Имя"
    f.input :is_main, :label => "Видна на главной"
    f.input :is_collection, :label => "Сделать коллекцией"
    f.input :image_thumb, :label => "Картинка для ленты"
    f.input :image_full, :label => "Картинка для ленты при наводе мыши"
  end
  f.actions
  end


  member_action :delete_full, :method => :delete do
    img = Lent.find(params[:id])
    img.remove_image_full!
    img.save
    flash[:notice]="Full img has been deleted"
    redirect_to :action => :show 
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
