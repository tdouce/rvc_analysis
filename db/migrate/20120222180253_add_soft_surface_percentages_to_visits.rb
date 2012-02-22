class AddSoftSurfacePercentagesToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :surface_relief_soft_cat_1, :integer
    add_column :visits, :surface_relief_soft_cat_2, :integer
    add_column :visits, :surface_relief_soft_cat_3, :integer
    add_column :visits, :surface_relief_soft_cat_4, :integer
    add_column :visits, :surface_relief_soft_cat_5, :integer
  end
end
