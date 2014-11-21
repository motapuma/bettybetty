class CreateKeyWords < ActiveRecord::Migration
  def change
    create_table :key_words do |t|
      t.string :word
      t.integer :type

      t.timestamps
    end
  end
end
