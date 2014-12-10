class AddAvatarColumnToCandidates < ActiveRecord::Migration
  def self.up
      add_attachment :candidates, :avatar
      add_attachment :allies,     :avatar
    end

    def self.down
      remove_attachment :candidates, :avatar
      remove_attachment :allies,     :avatar
    end
end
