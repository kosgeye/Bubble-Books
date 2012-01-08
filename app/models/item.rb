class Item < ActiveRecord::Base

belongs_to :user

validates :name, :presence => true, :length => { :maximum => 50 }
validates :user_id, :presence => true
  
default_scope :order => 'items.created_at DESC'
end
