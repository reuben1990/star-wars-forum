class Message < ActiveRecord::Base

  belongs_to :user
  
  attr_accessible :body
  
  default_scope :order => 'updated_at DESC'
  acts_as_api
  api_accessible :public do |t|
    t.add :body
    t.add lambda {|message| (message.created_at + 8.hours).strftime("%H:%M %D")}, :as => :created_at
    t.add :user, :template => :public
  end
end
