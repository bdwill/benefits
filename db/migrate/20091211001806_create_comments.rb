class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :benefit_id, :null => false
      t.integer :user_id, :null => false
      t.text :comment, :null => false
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :comments
  end
end
