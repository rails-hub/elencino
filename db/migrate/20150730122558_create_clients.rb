class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.date :dob
      t.string :nationality
      t.boolean :gender, :default => true
      t.text :occupation
      t.boolean :is_married, :default => false
      t.string :rfc
      t.string :curp
      t.text :street
      t.string :interior_number
      t.string :exterior_number
      t.string :suburb
      t.string :municipality
      t.string :state
      t.text :postal_address
      t.string :mobile_number
      t.string :office_number
      t.string :home_number
      t.references :user
      t.integer :created_by
      t.timestamps
    end
  end
end
