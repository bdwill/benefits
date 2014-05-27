class CreateBenefits < ActiveRecord::Migration
  def self.up
    create_table :benefits do |t|
      t.string :patient_Name, :limit => 30
      t.string :procedure, :limit => 20
      t.date :date
      t.decimal :amount_Due, :precision => 10, :scale => 2
      t.integer :office_id
      t.integer :signoff
      t.datetime :signoff_date
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :benefits
  end
end
