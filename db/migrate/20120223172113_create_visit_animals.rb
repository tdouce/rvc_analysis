class CreateVisitAnimals < ActiveRecord::Migration
  def change
    create_table :visit_animals do |t|
      t.integer :visit_id
      t.integer :animal_id

      t.timestamps
    end
  end
end
