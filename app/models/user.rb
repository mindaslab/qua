class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :questions, :dependent => :nullify
  has_many :answers, :dependent => :nullify
  has_one :profile, :dependent => :destroy
  
  def name
    begin
      profile.name
    rescue
      "Unknown"
    end
  end
end
