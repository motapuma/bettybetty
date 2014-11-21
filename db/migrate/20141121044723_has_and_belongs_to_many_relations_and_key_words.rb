class HasAndBelongsToManyRelationsAndKeyWords < ActiveRecord::Migration
  def change
  	create_table :key_words_relations, id: false do |t|
  	      t.belongs_to :key_word
  	      t.belongs_to :relation
  	    end
  end
end
