class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :link_id
      t.integer :ally_id
      t.integer :candidate_id
      t.integer :relation_type_id

      t.timestamps
    end
  end
end
