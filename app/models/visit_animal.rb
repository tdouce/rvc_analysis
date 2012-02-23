class VisitAnimal < ActiveRecord::Base
  belongs_to :visit
  belongs_to :animal
end
