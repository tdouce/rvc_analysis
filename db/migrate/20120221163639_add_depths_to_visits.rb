class AddDepthsToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :substrate_max_depth, :integer
    add_column :visits, :substrate_min_depth, :integer
  end
end
