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
  subject { build(:contact) }

  it { should belong_to(:company) }
  it {
    should have_many(:contact_companies).class_name('Company').with_foreign_key(:contract_person_id)
  }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:position) }

  it { should validate_uniqueness_of(:email) }
end
