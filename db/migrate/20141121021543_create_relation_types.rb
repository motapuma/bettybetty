class CreateRelationTypes < ActiveRecord::Migration
  def change
    create_table :relation_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
