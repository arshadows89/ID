class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
   	  t.string :text
      t.string :link

      t.timestamps null: false
    end
  end
end
