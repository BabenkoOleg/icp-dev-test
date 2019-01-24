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

require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
