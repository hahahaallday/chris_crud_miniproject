class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :title 
      t.text :description
      t.text :analysis_content
      t.integer :interest

      t.timestamps null:false
    end
  end
end
