class RemoveBenefitsProcedureTypeColumn < ActiveRecord::Migration
  def self.up
    remove_column :benefits, :procedure
  end

  def self.down
    add_column :benefits, :procedure, :string, :limit => 20
  end
end
