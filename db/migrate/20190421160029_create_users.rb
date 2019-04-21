class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :password
      t.string :nickname
      t.string :comment
      t.string :toke

      t.timestamps
    end
    add_index :users, :toke, unique: true
  end
end
