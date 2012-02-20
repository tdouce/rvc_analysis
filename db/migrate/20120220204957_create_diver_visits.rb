class CreateDiverVisits < ActiveRecord::Migration
  def change
    create_table :diver_visits do |t|
      t.integer :diver_id
      t.integer :visit_id

      t.timestamps
    end
  end
end
