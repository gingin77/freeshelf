class BooksController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :new, :destroy]


  def index
    @books = Book.all
  end

  def show
    set_book
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @book = @user.books.create(book_params)
    redirect_to books_path(@book)
    # @book = Book.new(book_params)
    #
    # respond_to do |format|
    #   if @book.save
    #     format.html { redirect_to @book, notice: 'Book was successfully created.' }
    #     format.json { render :show, status: :created, location: @book }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @book.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
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

  def destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def genre
  #   @books = Book.where(genre: params[:genres])
  # end

  private
    def require_login
      redirect_to login_path unless logged_in?
    end

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:id, :title, :author, :description, :URL)
    end
end
