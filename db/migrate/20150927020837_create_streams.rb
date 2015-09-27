class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
   	  t.string :text
      t.string :link
   	  t.string :streamer

      t.timestamps null: false
    end
  end
end
