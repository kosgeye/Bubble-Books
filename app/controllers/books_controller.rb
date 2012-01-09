class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  before_filter :authenticate, :only => [:create, :destroy, :edit, :new, :update, :show]
  before_filter :authorized_user, :only => :destroy
  def index
    @books = Book.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find params[:id], :include => [:user]


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book destroyed."
    redirect_to books_path
  end
  private
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
   end
   def authorized_user
      @book = current_user.book.find_by_id(params[:id])
      redirect_to root_path if @book.nil?
    end
end