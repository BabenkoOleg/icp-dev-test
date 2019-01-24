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

FactoryBot.define do
  sequence :contact_email do |n|
    "contact_#{n}@example.com"
  end

  factory :contact do
    name { Faker::Name.name  }
    email { generate(:contact_email) }
    phone { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
    position { 'RoR Developer' }

    company
  end
end
