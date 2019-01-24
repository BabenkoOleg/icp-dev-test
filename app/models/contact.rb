# == Schema Information
#
# Table name: contacts
#
#  id         :bigint(8)        not null, primary key
#  address    :string           not null
#  email      :string           not null
#  name       :string           not null
#  phone      :string           not null
#  position   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint(8)
#
# Indexes
#
#  index_contacts_on_company_id  (company_id)
#

class Contact < ApplicationRecord
  # === relations ===
  belongs_to :company
  has_many :contact_companies, class_name: 'Company', foreign_key: :contract_person_id

  # === validations ===
  validates_presence_of   :name, :email, :phone, :address, :position
  validates_uniqueness_of :email, case_sensitive: true
  validates_format_of     :email, with: /\A[^@\s]+@[^@\s]+\z/
end
