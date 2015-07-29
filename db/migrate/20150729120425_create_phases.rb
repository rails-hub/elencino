class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name,  null: false, default: ""
      t.references :user
      t.timestamps
    end

    add_index :phases, :name, unique: false
  end
end
