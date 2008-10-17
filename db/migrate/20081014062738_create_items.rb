class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.column :name, :string, :limit => 30
      t.column :quantity, :integer, :null => false, :default => 0
      t.column :price,  :integer, :null => false, :default => 0
    end
  end

  def self.down
    drop_table :items
  end

end
