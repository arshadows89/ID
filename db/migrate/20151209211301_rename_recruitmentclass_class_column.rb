class RenameRecruitmentclassClassColumn < ActiveRecord::Migration
  def change
  	rename_column :recruitmentclasses, :class, :wowclass
  end
end
