class ReactionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # GET /reactions
  def index
    @reactions = Reaction.all
  end

  # GET /reactions/1
  def show
    @reaction = Reaction.find(params[:id])
  end

  # GET /reactions/new
  def new
    @reaction = current_user.reactions.new
  end

  # GET /reactions/1/edit
  def edit
    @reaction = current_user.reactions.find(params[:id])
  end

  # POST /reactions
  def create
    @reaction = current_user.reactions.new(reaction_params)
      if @reaction.save
        redirect_to @reaction, notice: 'Reaction was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /reactions/1
  def update
      @reaction = current_user.reactions.find(params[:id])
      if @reaction.update(reaction_params)
        redirect_to @reaction, notice: 'Reaction was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /reactions/1
  def destroy
    @reaction = current_user.reactions.find(params[:id])
    @reaction.destroy
      redirect_to reactions_url, notice: 'Reaction was successfully destroyed.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def reaction_params
      params.require(:reaction).permit(:content)
    end
end
