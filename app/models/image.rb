class Image < ActiveRecord::Base
  belongs_to :lent, class_name: "Lent", foreign_key: "id", :dependent => :delete
  mount_uploader :image_full, ImageUploader
end
