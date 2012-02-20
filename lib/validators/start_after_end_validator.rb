
#class StartAfterEndValidator < ActiveModel::EachValidator
#
#  # This validator depends on the convention that is used to name the database fields
#  def validate_each( record, attribute, value )
#    attr = attribute.to_s.split("_")[0]
#    if record.send( attr + "_" + 'end') < record.send( attr + "_" + 'start') 
#      record.errors[attribute] << "time must be before #{ attr } end time."
#    end
#  end
#end
#

#ActiveRecord::Base.class_eval do
#  def self.validates_is_after( *attr_names )
#    # todo: validation code
#    debugger
#  end
#end
