class Image
  include Mongoid::Document
  field :order_num, type: Integer
  mount_uploader :picture, PictureUploader
  embedded_in :pizza
end
