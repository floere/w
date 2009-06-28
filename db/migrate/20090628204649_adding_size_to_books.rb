class AddingSizeToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :size, :integer
  end

  def self.down
    remove_column :books, :size
  end
end
