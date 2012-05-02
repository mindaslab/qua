class Tag < ActiveRecord::Base
  has_and_belongs_to_many :questions
  validates :name, :presence => true, :length => { :maximum => 50 }
end
