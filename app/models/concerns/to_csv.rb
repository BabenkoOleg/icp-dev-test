require 'csv'

module ToCSV
  extend ActiveSupport::Concern

  module ClassMethods
    def to_csv(attributes)
      CSV.generate(headers: true) do |csv|
        csv << attributes
        all.each { |record| csv << attributes.map { |attr| record.send(attr) } }
      end
    end
  end
end
