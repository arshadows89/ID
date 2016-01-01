class AddForumpageIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :forumpage_id, :integer
  end
end
