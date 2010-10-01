class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.date :born
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.string :nickname
      t.string :mobile
      t.string :city
      t.string :address
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
