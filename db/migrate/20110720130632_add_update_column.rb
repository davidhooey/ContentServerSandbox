class AddUpdateColumn < ActiveRecord::Migration
  
    def self.up
        add_column :instances, :update_level, :string
    end

    def self.down
        remove_column :instances, :update_level
    end
    
end
