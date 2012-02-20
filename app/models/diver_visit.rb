class DiverVisit < ActiveRecord::Base
  belongs_to :diver
  belongs_to :visit
end
