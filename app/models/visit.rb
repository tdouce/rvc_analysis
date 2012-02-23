class Visit < ActiveRecord::Base

  # virtual attribute
  attr_accessor :hard_surface_relief_coverage, :soft_surface_relief_coverage

  before_validation :surface_relief_hard_total_starting_number,
                    :surface_relief_soft_total_starting_number

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

  validates :surface_relief_hard_cat_1, :numericality => true, :allow_blank => true
  validates :surface_relief_hard_cat_2, :numericality => true, :allow_blank => true
  validates :surface_relief_hard_cat_3, :numericality => true, :allow_blank => true
  validates :surface_relief_hard_cat_4, :numericality => true, :allow_blank => true
  validates :surface_relief_hard_cat_5, :numericality => true, :allow_blank => true

  # Custon validation
  validates_adds_to_100 :hard_surface_relief_coverage, 
                        :sum => [ 
                                  :surface_relief_hard_cat_1, 
                                  :surface_relief_hard_cat_2, 
                                  :surface_relief_hard_cat_3, 
                                  :surface_relief_hard_cat_4, 
                                  :surface_relief_hard_cat_5 
                                ], 
                        :message => "does not sum to 100."

  validates :surface_relief_soft_cat_1, :numericality => true, :allow_blank => true
  validates :surface_relief_soft_cat_2, :numericality => true, :allow_blank => true
  validates :surface_relief_soft_cat_3, :numericality => true, :allow_blank => true
  validates :surface_relief_soft_cat_4, :numericality => true, :allow_blank => true
  validates :surface_relief_soft_cat_5, :numericality => true, :allow_blank => true

  # Custon validation
  validates_adds_to_100 :soft_surface_relief_coverage, 
                        :sum => [ 
                                  :surface_relief_soft_cat_1, 
                                  :surface_relief_soft_cat_2, 
                                  :surface_relief_soft_cat_3, 
                                  :surface_relief_soft_cat_4, 
                                  :surface_relief_soft_cat_5 
                                ], 
                        :message => "does not sum to 100."

  private

    def surface_relief_hard_total_starting_number
      self.hard_surface_relief_coverage = 0
    end

    def surface_relief_soft_total_starting_number
      self.soft_surface_relief_coverage = 0
    end

end
