class Book < ActiveRecord::Base
belongs_to :user
default_scope :order => 'books.created_at DESC'
end
