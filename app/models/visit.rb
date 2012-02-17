class Visit < ActiveRecord::Base

  validates :dive_start, :presence => true
  validates :dive_end,   :presence => true
  validates :dive_start, :presence => true, :dive_end_after_dive_start => true

end
