class AddForumtypeIdToForums < ActiveRecord::Migration
  def change
  	add_column :forums, :forumtype_id, :integer
  end
end
