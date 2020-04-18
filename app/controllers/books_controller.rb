class BooksController < ApplicationController
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @books = Book.all.includes(:user).order("created_at DESC")
    
  end

  def new
    @book = Book.new
  end

  def show
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
    @like = Like.new
  end

  def search
    @books = Book.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    Book.create(book_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @book = Book.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
