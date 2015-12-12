class CreatePlaylistsTable < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
    	t.string :link
    end
  end
end
