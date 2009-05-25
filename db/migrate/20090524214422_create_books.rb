class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.column :url,      :string, :limit => 40
      t.column :email,    :string, :limit => 60
      
      t.column :author,   :string, :limit => 80
      t.column :title,    :string, :limit => 40
      t.column :subtitle, :string, :limit => 60
      t.column :text,     :text             
      t.column :license,  :string, :limit => 10
      
      t.column :locale,   :string, :limit =>  5
      t.column :password, :string, :limit => 16
      
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
