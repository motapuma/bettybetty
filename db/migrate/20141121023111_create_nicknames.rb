class CreateNicknames < ActiveRecord::Migration
  def change
    create_table :nicknames do |t|
      t.integer :candidate_id
      t.integer :ally_id
      t.string :nick

      t.timestamps
    end
  end
end
