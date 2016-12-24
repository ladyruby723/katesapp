class UsersController < ApplicationController
  def show
      @user = User.find_by(username: params[:username])
      @reactions = @user.reactions
  end
end
