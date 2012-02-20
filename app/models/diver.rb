class Diver < ActiveRecord::Base

  has_many :diver_visits
  has_many :visits, :through => :diver_visits

  validates :last_name,  :presence => true
  validates :first_name, :presence => true

  def full_name
    [self.first_name, self.last_name].join(" ")
  end

end
