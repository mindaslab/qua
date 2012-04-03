class Answer < ActiveRecord::Base
  validates_presence_of :content, :message => " of answer should not be blank." 
  belongs_to :question
end
