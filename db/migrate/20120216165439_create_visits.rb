class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :dive_start
      t.datetime :dive_end
      t.datetime :sample_start
      t.datetime :sample_end

      t.timestamps
    end
  end
end
