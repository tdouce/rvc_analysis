class DiverVisit < ActiveRecord::Base
  belongs_to :diver
  belongs_to :visit
  accepts_nested_attributes_for :visit
end
