class Lab < ActiveRecord::Base

  has_many :users
  has_many :systems

  has_one :lab_approval, dependent: :destroy

  belongs_to :manger, foreign_key: "mgr_id", class_name: "User"

  has_attached_file :accrediation
  do_not_validate_attachment_file_type :accrediation

  has_attached_file :loa
  do_not_validate_attachment_file_type :loa

end
