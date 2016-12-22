class Test < ActiveRecord::Base
  has_many :encrypters
  has_many :routers
  has_one :test_approval, dependent: :destroy

  belongs_to :network
  belongs_to :system

  has_attached_file :allLabMoA
  do_not_validate_attachment_file_type :allLabMoA

  has_attached_file :testProcedures
  do_not_validate_attachment_file_type :testProcedures
end
