class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update, :new]

  def new
    @my_email = current_user.email
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    end
  end

  private
    def set_user
      @user = User.find(current_user.id)
    end
    def user_params
      params.require(:user).permit(:name, :like, :dislike, :relation)
    end
end