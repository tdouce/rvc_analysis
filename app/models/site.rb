class Site < ActiveRecord::Base

  validates :name, :presence => true

end
