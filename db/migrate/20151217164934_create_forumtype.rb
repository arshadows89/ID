class CreateForumtype < ActiveRecord::Migration
  def change
    create_table :forumtypes do |t|
      t.string :title
    end
  end
end
