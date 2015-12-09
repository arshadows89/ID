class CreateRecruitment < ActiveRecord::Migration
  def change
    create_table :recruitments do |t|
      t.string :spec
      t.boolean :recruiting
    end
  end
end
