class CreateBookUsers < ActiveRecord::Migration
  def change
    create_table :book_users do |t|
    	t.integer :user_id
    	t.integer :book_id
      t.timestamps null: false
    end
  end
end
