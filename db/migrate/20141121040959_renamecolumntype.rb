class Renamecolumntype < ActiveRecord::Migration
  def change
      rename_column :key_words, :type, :relation_type_id
  end
end
