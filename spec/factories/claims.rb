# == Schema Information
#
# Table name: claims
#
#  id                       :bigint(8)        not null, primary key
#  cap_drop                 :integer
#  current_potential_income :integer
#  data_provided            :boolean          default(FALSE)
#  likely_bookbuild         :boolean          default(FALSE)
#  percentage_drop          :integer
#  price_drop               :integer
#  signed_losses            :integer
#  status                   :integer          default(0)
#  total_potential_income   :integer
#  traded_inflation         :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  company_id               :bigint(8)
#
# Indexes
#
#  index_claims_on_company_id  (company_id)
#

FactoryBot.define do
  factory :claim do
    cap_drop { Faker::Number.decimal(3, 2) }
    data_provided { Faker::Boolean.boolean }
    likely_bookbuild { Faker::Boolean.boolean }
    percentage_drop { Faker::Number.decimal(3, 2) }
    price_drop { Faker::Number.decimal(3, 2) }
    signed_losses { Faker::Number.decimal(3, 2) }
    status { Claim.statuses.keys.sample.to_sym }
    total_potential_income { Faker::Number.decimal(3, 2) }
    traded_inflation { Faker::Number.decimal(3, 2) }

    company
  end
end
