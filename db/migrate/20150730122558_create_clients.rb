class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name,              null: false, default: ""
      t.string :first_last_name,              null: false, default: ""
      t.string :second_last_name,              null: false, default: ""
      t.date :date_of_birth
      t.string :nationality
      t.string :municipality_of_birth
      t.string :state_of_birth
      t.boolean :sex, :default => true
      t.string :occupation
      t.boolean :married, :default => false
      t.string :matrimonial_regime
      t.string :rfc
      t.string :curp
      t.string :street
      t.string :interior_number
      t.string :exterior_number
      t.string :suburb
      t.string :municipality
      t.string :state
      t.string :postal_address
      t.string :mobile_number
      t.string :office_number
      t.string :home_number
      t.string :email,              null: false, default: ""
      t.integer :salesman_id
      t.timestamps
    end
  end
end
