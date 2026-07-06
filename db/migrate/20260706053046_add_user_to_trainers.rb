class AddUserToTrainers < ActiveRecord::Migration[8.1]
  def change
    add_reference :trainers, :user, foreign_key: true
  end
end
