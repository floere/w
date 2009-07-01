class LengthenAttributes < ActiveRecord::Migration
  def self.up
    add_index :books, :size
    
    change_column :books, :title, :string, :limit => 100
    change_column :books, :url, :string, :limit => 150
  end

  def self.down
    remove_index :books, :size
    
    change_column :books, :title, :string, :limit => 40
    change_column :books, :url, :string, :limit => 40
  end
end
