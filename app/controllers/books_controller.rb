class BooksController < ApplicationController
  
  # This book has not yet been created.
  #
  def new
    @book = Book.new :title => params[:id]
  end
  
  # Checks if book exists.
  # Checks Captcha.
  # Creates a new one with the given password.
  #
  def create
    
  end
  
  # Show the book for reading.
  #
  def show
    book = Book.find_by_id params[:id]
    
    if book
      render
    else
      redirect_to :action => :new
    end
  end
  
  # Show the book for editing and adding text.
  #
  def edit
    
  end
  
end
