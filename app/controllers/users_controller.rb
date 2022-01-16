class UsersController < ApplicationController
  
  def index
   @users = User.all
   @new_book = Book.new
  end
  
  def show
      @new_book = Book.new
      @user = User.find(params[:id])
      @books = @user.books
  end

  def edit
      @user = User.find(params[:id])
  end
  
  def update
      @user=User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(current_user.id)
  end
  
  private
    def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
    end
end