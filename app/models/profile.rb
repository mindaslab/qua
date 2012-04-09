class Profile < ActiveRecord::Base
  belongs_to :user
  validates :about_you, :length=>{:maximum=>300}
end
