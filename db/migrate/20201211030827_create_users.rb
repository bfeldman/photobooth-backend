class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email_address
      t.boolean :is_public

      t.timestamps
    end
  end
end
