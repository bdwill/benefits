class AddAdminUser < ActiveRecord::Migration
  def self.up
    User.create({:login => 'admin', :name => 'Administrator', :password => 'admin', :password_confirmation => 'admin'})
  end

  def self.down
    admin_user = User.find_by_login('admin')
    admin_user.destroy
  end
end
