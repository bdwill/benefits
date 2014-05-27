class AddSearchIndices < ActiveRecord::Migration
  def self.up
    add_index :benefits, :patient_Name
    add_index :benefits, :date
  end

  def self.down
    remove_index :benefits, :patient_Name
    remove_index :benefits, :date
  end
end
