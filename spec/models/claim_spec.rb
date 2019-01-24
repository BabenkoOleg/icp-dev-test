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

require 'rails_helper'

RSpec.describe Claim, type: :model do
  subject { build(:claim) }

  it { should belong_to(:company) }

  it { should validate_presence_of(:percentage_drop) }
  it { should validate_presence_of(:price_drop) }
  it { should validate_presence_of(:cap_drop) }
  it { should validate_presence_of(:signed_losses) }
  it { should validate_presence_of(:current_potential_income) }
  it { should validate_presence_of(:total_potential_income) }
  it { should validate_presence_of(:traded_inflation) }

  it { should define_enum_for(:status).with_values([:created, :approved, :blocked]) }
end
