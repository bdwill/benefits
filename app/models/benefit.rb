class Benefit < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 100
  
  belongs_to :office
  belongs_to :user, :foreign_key => 'signoff'
  has_many :comments, :dependent => :destroy
  
  validates_presence_of :patient_Name
  validates_presence_of :payment_type
  validates_presence_of :amount_Due
  validates_presence_of :office_id
  validates_numericality_of :amount_Due
  
  def user_signoff(user_id)
    self.signoff = user_id
    self.active = false
    self.signoff_date = Time.now
    return self.save
  end
end