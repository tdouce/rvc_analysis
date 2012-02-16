class Visit < ActiveRecord::Base
  #validate  :dive_start_must_be_before_dive_end
  validates :dive_start, :presence => true
  validates :dive_end,   :presence => true
  #validates :dive_end,   :presence => true, :if => :dive_end_after_dive_start?

  def dive_end_after_dive_start?
    self.dive_start < self.dive_end
  end
  
end
