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

FactoryBot.define do
  sequence :company_email do |n|
    "company_#{n}@example.com"
  end

  factory :company do
    name { Faker::Name.name  }
    email { generate(:company_email) }
    phone { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
    web_site { "https://#{Faker::Internet.domain_name}" }
  end
end
