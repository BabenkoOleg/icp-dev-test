# == Schema Information
#
# Table name: companies
#
#  id                :bigint(8)        not null, primary key
#  address           :string           not null
#  email             :string           not null
#  name              :string           not null
#  phone             :string           not null
#  web_site          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  contact_person_id :integer
#

class Company < ApplicationRecord
  # === concerns ===
  include ToCSV

  # === relations ===
  belongs_to :contact_person, class_name: 'Contact', optional: true
  has_many :contacts
  has_many :claims, dependent: :destroy

  # === validations ===
  validates_presence_of   :name, :email, :phone, :address
  validates_uniqueness_of :email, case_sensitive: true
  validates_format_of     :email, with: /\A[^@\s]+@[^@\s]+\z/
end
