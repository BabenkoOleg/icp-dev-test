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

require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { build(:company) }

  it { should belong_to(:contact_person).optional }
  it { should have_many(:contacts) }
  it { should have_many(:claims).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:address) }

  it { should validate_uniqueness_of(:email) }
end
