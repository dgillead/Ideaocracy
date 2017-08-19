class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.text 'title'
      t.text 'description'
      t.timestamps
    end
  end
end
