class Picture < ActiveRecord::Base
   belongs_to :apartment
   has_attached_file :image
  # Validate content type
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # Validate filename
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :image
end