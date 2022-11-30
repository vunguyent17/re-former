# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_post_params)
    if @user.save
      flash[:success] = 'Great! Your account has been created!'
      redirect_to new_user_path
    else
      flash.now[:error] = 'Error'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(allowed_update_params)
      flash[:success] = 'Great! Your account has been updated!'
      redirect_to new_user_path
    else
      flash.now[:error] = 'Error'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allowed_post_params
    params.require(:user).permit(:username, :email, :password)
  end

  def allowed_edit_params
    params.require(:user).permit(:id)
  end

  def allowed_update_params
    params.require(:user).permit(:id, :username, :email, :password)
  end
end
