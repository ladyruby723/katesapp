class FeedController < ApplicationController
    before_action :authenticate_user!

  def show
      @reactions = Reaction.where(user: current_user.all_following)
  end
end
