class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :name
      t.string :tg_id
      t.string :vk_token
      t.string :state, null: false

      t.timestamps
      t.timestamp :loged_in
      t.timestamp :loged_out
    end
  end

  def down
    drop_table :users
  end
end
