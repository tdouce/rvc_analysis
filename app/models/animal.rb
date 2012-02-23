class Animal < ActiveRecord::Base
  has_many  :visit_animals
  has_many  :visits, :through => :visit_animals

  validates :scientific_name, :presence => true, :uniqueness => true
  validates :common_name,     :presence => true
end
