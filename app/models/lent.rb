class Lent < ActiveRecord::Base
	has_many :lents, class_name: "Lent", foreign_key: "main_id"
	has_many :images

	belongs_to :main, -> { where(is_main: true, is_collection: false) }, class_name: "Lent", foreign_key: "id"
	mount_uploader :image_full, ImageUploader
	mount_uploader :image_thumb, ImageUploader

	scope :all_main, -> { where(is_main: true) }
	scope :is_collection, -> { where(is_collection: true) }
	scope :collections, -> { where(is_main:true, is_collection: true) }
	scope :not_collections, -> { where(is_main:true, is_collection: false) }
	scope :inside_collections, -> { where(is_main:false, is_collection: false) }

end