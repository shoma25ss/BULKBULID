class CreateStores < ActiveRecord::Migration[8.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :code
      t.string :area
      t.string :manager_name
      t.string :phone
      t.string :email
      t.integer :status

      t.timestamps
    end
  end
end
