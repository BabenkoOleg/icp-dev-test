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
end
