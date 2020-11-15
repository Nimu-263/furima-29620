class AddBirthDayToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birth_day, :date, null: false
  end
end
