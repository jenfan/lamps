# encoding: utf-8
ActiveAdmin.register Gallery do
  menu :label => "Галерея",:priority => 26
  
  index do
    selectable_column
    column "Имя", :name
    column "Картинка",:path do |image|
      image_tag image.path, size: "50x50"
    end
    actions
  end

  show do
    columns do
      column :span => 1 do
        h4 gallery.name
        div do
          image_tag gallery.path, size: "300x300"
        end
      end
    end
  end
  permit_params :name, :path

end
