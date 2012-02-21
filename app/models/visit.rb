class Visit < ActiveRecord::Base

  belongs_to :site

  has_many  :diver_visits
  has_many  :divers, :through => :diver_visits
  accepts_nested_attributes_for :diver_visits


  validates :dive_start,            :presence => true
  validates :dive_end,              :presence => true
  validates :sample_start,          :presence => true

  # Custom validations
  validates_is_after :dive_end,     :after => :dive_start
  validates_is_after :sample_end,   :after => :sample_start
  validates_is_after :sample_start, :after => :dive_start
  validates_is_after :dive_end,     :after => :sample_end

end
