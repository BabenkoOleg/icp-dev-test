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
  pending "add some examples to (or delete) #{__FILE__}"
end
