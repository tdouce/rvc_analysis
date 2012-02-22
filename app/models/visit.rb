class Visit < ActiveRecord::Base

  # virtual attribute
  attr_accessor :surface_relief_hard_total

  before_validation :surface_relief_hard_total_starting_number

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

  # Custom validations
  validates_is_greater_than :substrate_max_depth, :greater_than => :substrate_min_depth

  validates :surface_relief_hard_cat_1, :presence => true
  validates :surface_relief_hard_cat_2, :presence => true
  validates :surface_relief_hard_cat_3, :presence => true
  validates :surface_relief_hard_cat_4, :presence => true
  validates :surface_relief_hard_cat_5, :presence => true

  validates_adds_to_100 :surface_relief_hard_total, 
                        :sum => [ 
                                  :surface_relief_hard_cat_1, 
                                  :surface_relief_hard_cat_2, 
                                  :surface_relief_hard_cat_3, 
                                  :surface_relief_hard_cat_4, 
                                  :surface_relief_hard_cat_5 
                                ], 
                        :message => ["Hard surface relief coverage", "does not sum to 100."]

  private

    def surface_relief_hard_total_starting_number
      self.surface_relief_hard_total = 0
    end

end
