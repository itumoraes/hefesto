# frozen_string_literal: true
class UserController < ApplicationController
  def update
    @user = User.find(params[:id])
    flash[:success] = I18n.t('.users.user_updated') if @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:team_id)
  end
end
