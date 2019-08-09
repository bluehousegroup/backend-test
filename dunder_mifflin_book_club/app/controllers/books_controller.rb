class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  require "base64"

  # GET /books
  # GET /books.json
  def index
   if(params[:s] != nil)
      session[:sort_mode] = params[:s]
    else
      session[:sort_mode] = "c"
    end

    if(session[:sort_mode] == "a")
      @books = Book.all.order("author ASC")
    else
      @books = Book.all.order("sort_order DESC")
    end
  end

  def move_up
    resort_orders
    @book = Book.find(params[:id])
    @above_book = Book.all.where(sort_order: @book.sort_order + 1).first

    if(@above_book != nil)
      new_order = @above_book.sort_order
      @above_book.sort_order = @book.sort_order
      @book.sort_order = new_order
      @above_book.save
      @book.save
    end

    redirect_to "/books"
  end

  def move_down
    resort_orders
    @book = Book.find(params[:id])
    @above_book = Book.all.where(sort_order: @book.sort_order - 1).first

    if(@above_book != nil)
      new_order = @above_book.sort_order
      @above_book.sort_order = @book.sort_order
      @book.sort_order = new_order
      @above_book.save
      @book.save
    end

    redirect_to "/books"
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    resort_orders
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    resort_orders
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    resort_orders
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def resort_orders
      @books = Book.all.order("sort_order ASC")
      i = 0
      @books.each do |book|
        book.sort_order = i
        book.save
        i = i+1
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :publish_date, :description, :cover_image)
    end
end
