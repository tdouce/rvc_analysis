class Animal < ActiveRecord::Base
  has_many  :visit_animals
  has_many  :visits, :through => :visit_animals
end
