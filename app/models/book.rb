class Book < ActiveRecord::Base
default_scope :order => 'books.created_at DESC'
end
