ActiveRecord::Base.class_eval do
  def self.validates_date(*attr_names)
    options = attr_names.extract_options!
    validates_each(attr_names, options) do |record, attribute, value|
      record.errors.add(attribute, 'is not a valid date') unless value.is_a?(Date)
    end
  end
end

# def valid_dates?
#   errors.add(:complete_date, 'is not a valid date') unless complete_date.is_a?(Date)
# end