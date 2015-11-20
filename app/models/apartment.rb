class Apartment < ActiveRecord::Base
  include AASM

  belongs_to :user
  has_many :pictures, :dependent => :destroy
  validates :title, presence: true
  accepts_nested_attributes_for :pictures, :reject_if => lambda { |t| t['trip_image'].nil? }

  	scope :publicados, -> {where(state:"published")}
  	scope :ultimos, -> {order("created_at DESC").limit(10)}

		aasm column: "state" do
		state :in_draft, initial: true
		state :published


		event :published do
		transitions from: :in_draft,to: :published
		end

		event :unpuclished do
			transitions from: :published,to: :in_draft
		end



		end


end
