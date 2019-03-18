class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:saccess]="登録されました"
      redirect_to @user
    else 
      flash.now[:danger]="登録に失敗しました"
      redirect_to :new
    end 
  end
  
  private
  
  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
end
