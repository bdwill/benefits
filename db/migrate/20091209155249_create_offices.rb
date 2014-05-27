class CreateOffices < ActiveRecord::Migration
  def self.up
    create_table :offices do |t|
      t.string :office, :limit => 10
    end
    
    Office.create([{:office => "Metairie"}, {:office => "Uptown"}, {:office => "Westbank"}])
  end

  def self.down
    drop_table :offices
  end
end
