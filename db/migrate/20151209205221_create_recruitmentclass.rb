class CreateRecruitmentclass < ActiveRecord::Migration
  def change
    create_table :recruitmentclasses do |t|
      t.string :class
    end
  end
end
