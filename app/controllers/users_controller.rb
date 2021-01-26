class UsersController < ApplicationController
  
def index
  @users = User.all
  @user = User.find(current_user.id)
end

def show
  @user = User.find(params[:id])
  @book = Book.new
  @books = @user.books
end

def update
end
  

private
  # ストロングパラメータ
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image_id)
end
end 