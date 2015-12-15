class CreateNewsTable < ActiveRecord::Migration
  def change
    create_table :homepagenews do |t|
      t.string :title
      t.text :news
      t.timestamps null: false
    end
  end
end
