class Message < ActiveRecord::Base
  belongs_to :user
  
  # Accessors
  attr_accessible :body
  
  # Validations
  validates :body,    :presence => true
  
  # Scopes
  default_scope :order => 'updated_at ASC'
end
