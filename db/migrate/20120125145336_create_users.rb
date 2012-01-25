class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :login
      t.text :email
      t.text :password

      t.timestamps
    end
  end
end
