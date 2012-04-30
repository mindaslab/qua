class Question < ActiveRecord::Base
  attr_protected :user_id
  validates_presence_of :content, :message => " of question should not be blank."
  has_many :answers, :dependent => :destroy
  has_and_belongs_to_many :tags
  belongs_to :user
end
