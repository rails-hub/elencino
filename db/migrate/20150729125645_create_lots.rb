class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.references :block
      t.integer :lot_number, :presence => true
      t.float :area, :null => false, :default => 0
      t.boolean :status, :null => false, :default => false
      t.float :price, :null => false, :default => 0
      t.float :total, :null => false, :default => 0
      t.text :street, :null => true, :default => ''

      t.timestamps
    end

    add_index :lots, :lot_number
  end
end
