class CriticsController < ApplicationController
  # GET /games/:game_id/critics/new
  def new
    @game = Game.find(params[:game_id])
    @critic = @game.critics.new
  end

  # POST /games/:game_id/critics
  def create
    @game = Game.find(params[:game_id])
    @critic = @game.critics.new(critic_params)
    if @critic.save
      redirect_to @game
    else
      render 'new'
    end
  end

  # GET /games/:game_id/critics/:id/edit
  def edit
    @game = Game.find(params[:game_id])
    @critic = @game.critics.find(params[:id])
  end

  # PATCH /games/:game_id/critics/:id
  def update
    @game = Game.find(params[:game_id])
    @critic = @game.critics.find(params[:id])
    if @critic.update(critic_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  # DELETE /games/:game_id/critics/:id
  def destroy
    @game = Game.find(params[:game_id])
    @critic = @game.critics.find(params[:id])
    @critic.destroy
    redirect_to @game
  end

  private

  def critic_params
    params.require(:critic).permit(:title, :body, :user_id)
  end
end
