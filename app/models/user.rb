class User < ActiveRecord::Base
  acts_as_api
  
  include Gravtastic
  gravtastic :size => 165, :filetype => :png, :rating => 'R'
    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true, :uniqueness => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :customer_messages, :dependent => :destroy
  has_many :news, :dependent => :destroy
  has_many :messages, :dependent => :destroy 
  
  def admin?
    true if self.username == 'admin'
  end

  api_accessible :public do |t| 
    t.add :username
  end
end
