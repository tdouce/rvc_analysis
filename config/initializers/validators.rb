
ActiveRecord::Base.class_eval do

  def self.validates_is_after( *attr_names )

    configuration = {}
    
    # Retrieves last element in array IF last element is a hash
    configuration.update(attr_names.extract_options!)

    validates_each( attr_names ) do |record, attr_name, value|

      unless value.nil?
        
        # Allows user to pass in a time directly
        if configuration[:after].is_a?(Time)
          after_date = configuration[:after]
        else
          after_date = record.send(configuration[:after])
        end

        unless after_date.nil?
          if record.send( attr_name ) < after_date
            record.errors.add( attr_name, "must be after #{ configuration[:after].to_s.titleize } time.") if value
          end
        end
      end
    end
  end

  def self.validates_is_greater_than( *attr_names )

    configuration = {}
    
    # Retrieves last element in array IF last element is a hash
    configuration.update(attr_names.extract_options!)

    validates_each( attr_names ) do |record, attr_name, value|

      unless value.nil?
        
        # Allows user to pass in a time directly
        if configuration[:greater_than].is_a?(Integer)
          greater_than_num = configuration[:greater_than]
        else
          greater_than_num = record.send(configuration[:greater_than])
        end

        unless greater_than_num.nil?
          if record.send( attr_name ) < greater_than_num
            record.errors.add( attr_name, "must be greater than #{ configuration[:greater_than].to_s.titleize }.") if value
          end
        end
      end
    end
  end
end
