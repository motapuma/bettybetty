class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.content :text
      t.integer :journal
      t.string :author
      t.string :url

      t.timestamps
    end
  end
end
