class BooksController < ApplicationController
  
  def index
    
  end
  def random
    @books = Book.find :all, :order => 'RAND()', :limit => 10
  end
  
  def new
    redirect_to :action => :title
  end
  
  # Registering process.
  #
  def title
    session[:book] = { :title => params[:id] }
    @book = Book.new session[:book]
  end
  def copyright
    session[:book] = params[:book]
    @book = Book.new session[:book]
  end
  def introduction
    session[:book] = params[:book]
    @book = Book.new session[:book]
  end
  # Finally creates the book.
  #
  def create
    book = Book.new params[:book]
    if book.save
      session.delete :book
      redirect_to_the book # :show, :url => book.url
    else
      
    end
  end
  
  # Show the book for reading.
  #
  def show
    @book = Book.find_by_url params[:url]
    if @book
      render
    else
      redirect_to :action => :title
    end
  end
  
  # Show the book for editing and adding text.
  #
  def edit
    @book = Book.find_by_url params[:url]
  end
  
  def update
    book = Book.find_by_url params[:url]
    text = params[:book][:text]
    if book && text
      book.update_attribute :text, text
      redirect_to_the book
    else
      
    end
  end
  
  private
    
    def redirect_to_the book
      redirect_to "/#{book.url}"
    end
  
end
