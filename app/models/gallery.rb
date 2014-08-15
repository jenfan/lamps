class Gallery < ActiveRecord::Base
	mount_uploader :path, ImageUploader
end
