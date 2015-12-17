class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.integer :post_id
      t.string :title
    end
  end
end
