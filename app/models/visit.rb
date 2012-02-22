class Visit < ActiveRecord::Base

  belongs_to  :site
  has_many    :diver_visits
  has_many    :divers, :through => :diver_visits
  accepts_nested_attributes_for :diver_visits

  validates :site,                  :presence => true
  #validates :divers,                :presence => true
  validates :dive_start,            :presence => true
  validates :dive_end,              :presence => true
  validates :sample_start,          :presence => true

  # Custom validations
  validates_is_after :dive_end,     :after => :dive_start
  validates_is_after :sample_end,   :after => :sample_start
  validates_is_after :sample_start, :after => :dive_start
  validates_is_after :dive_end,     :after => :sample_end

  validates :substrate_max_depth,   :presence => true, :numericality => {:only_integer => true, :less_than_or_equal_to => 100  }
  validates :substrate_min_depth,   :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 5  }

  validates_is_greater_than :substrate_max_depth, :greater_than => :substrate_min_depth

end
