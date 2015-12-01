class Payment < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :user
  validates :apartment_id, presence: true
  validates :user_id, presence: true
  before_save :valores_por_default

  private
  def valores_por_default
  	self.state ||=1
  end
end
