class User < ActiveRecord::Base
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
  
  def admin?
    true if self.username == 'codezombie'
  end
end
