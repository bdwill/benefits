class AddBenefitsPaymentTypeColumn < ActiveRecord::Migration
  def self.up
    add_column :benefits, :payment_type, :string, :limit => 20
  end

  def self.down
    remove_column :benefits, :payment_type
  end
end
