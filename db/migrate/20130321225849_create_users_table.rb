class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_admin, :default => 'false'
      t.string :funfact
      t.timestamps
    end
  end
end
