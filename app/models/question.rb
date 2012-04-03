class Question < ActiveRecord::Base
  validates_presence_of :content, :message => " of question should not be blank."
  has_many :answers, :dependent => :destroy
end
