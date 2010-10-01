class CreateObjs < ActiveRecord::Migration
  def self.up
    create_table :objs do |t|
      t.string :name
      t.string :cat
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :objs
  end
end
