class CreateInstances < ActiveRecord::Migration
    
    def self.up
        create_table :instances do |t|
            t.string "host_name", :limit => 50
            t.string "service_name", :limit => 50
            t.string "cs_version", :string, :limit => 10
            t.string "rm_version", :limit => 10
            t.timestamps
        end
        add_index('instances', 'host_name')
        add_index('instances', 'service_name')
    end

    def self.down
        drop_table :instances
    end
    
end
