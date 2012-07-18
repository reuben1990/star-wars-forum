class CustomerMessage < ActiveRecord::Base
  belongs_to :user
  
  # Accessors
  attr_accessible :body, :title
  
  # Validations
  validates :title,   :presence => true
  validates :body,    :presence => true
  
  # Scopes
  default_scope :order => 'updated_at DESC'

end
