class System < ActiveRecord::Base
  has_many :tests
  has_one :system_approval, dependent: :destroy

  belongs_to :lab

  has_attached_file :atoDoc
  do_not_validate_attachment_file_type :atoDoc
end
