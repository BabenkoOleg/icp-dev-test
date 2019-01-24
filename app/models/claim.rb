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
#  status                   :integer          default("created")
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

class Claim < ApplicationRecord
  # === relations ===
  belongs_to :company

  # === validations ===
  validates_presence_of :percentage_drop, :price_drop, :cap_drop, :signed_losses,
                        :current_potential_income, :total_potential_income, :traded_inflation

  # === enums ===
  enum status: [:created, :approved, :blocked]
end
