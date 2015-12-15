class AddHomepageIdToHomepagenews < ActiveRecord::Migration
  def change
  	add_column :homepagenews, :homepage_id, :integer
  end
end
