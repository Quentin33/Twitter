class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :twit

      t.timestamps
    end
  end
end
