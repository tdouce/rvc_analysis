
class DiveEndAfterDiveStartValidator < ActiveModel::EachValidator
  def validate_each( record, attribute, value )
    if record.dive_end < record.dive_start 
      record.errors[attribute] << "Dive end time must be after dive start time."
    end
  end
end
