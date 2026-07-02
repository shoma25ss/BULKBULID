class CreateTrainers < ActiveRecord::Migration[8.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :role
      t.integer :employment_type
      t.references :store, null: false, foreign_key: true
      t.string :phone
      t.string :email
      t.integer :session_price
      t.date :registered_on

      t.timestamps
    end
  end
end
