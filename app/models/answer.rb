class Answer < ActiveRecord::Base
  attr_protected :user_id
  validates_presence_of :content, :message => " of answer should not be blank." 
  validates :content, :length => { :maximum => 10000 }
  belongs_to :question
  belongs_to :user
end
