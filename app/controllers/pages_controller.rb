class PagesController < ApplicationController
  def home
  @title = "Home"
  @book = Book.new if signed_in?
  end

  def contact
  @title = "Contact"
  end
  
  def about
  @title = "About"
  end

end
