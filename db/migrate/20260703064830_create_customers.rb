class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :name_kana
      t.integer :gender
      t.date :birthday
      t.string :phone
      t.string :email
      t.integer :status
      t.references :store, null: false, foreign_key: true
      t.references :trainer, null: false, foreign_key: true
      t.date :join_date
      t.string :referral_source

      t.timestamps
    end
  end
end
