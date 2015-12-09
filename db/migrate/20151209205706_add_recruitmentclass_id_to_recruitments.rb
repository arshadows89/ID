class AddRecruitmentclassIdToRecruitments < ActiveRecord::Migration
  def change
  	add_column :recruitments, :recruitmentclass_id, :integer
  end
end
