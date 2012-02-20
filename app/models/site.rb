class Site < ActiveRecord::Base

  has_many  :visits

  validates :name, :presence => true

end
