class Visit < ActiveRecord::Base

  validates :dive_start,            :presence => true
  validates :dive_end,              :presence => true
  validates :sample_start,          :presence => true
  validates_is_after :dive_end,     :after => :dive_start
  validates_is_after :sample_end,   :after => :sample_start
  validates_is_after :sample_start, :after => :dive_start
  validates_is_after :dive_end,     :after => :sample_end

end
