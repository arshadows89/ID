class CreateForumpage < ActiveRecord::Migration
  def change
    create_table :forumpages do |t|
    	t.integer "forum_id"
    end
  end
end
