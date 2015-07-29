class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :block_number,  null: false
      t.references :phase

      t.timestamps
    end

    add_index :blocks, :block_number
  end
end
