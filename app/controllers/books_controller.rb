class BooksController < ApplicationController
  
  # This book has not yet been created.
  # Create a new book here.
  #
  def new
    
  end
  
  # Show the book for reading.
  #
  def show
    redirect_to :action => :new unless false # params[:id]
  end
  
  # Show the book for editing and adding text.
  #
  def edit
    
  end
  
end
