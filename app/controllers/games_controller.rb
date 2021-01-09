class GamesController < ApplicationController
  # GET /
  def index; end

  # GET /games/:id
  def show; end

  # GET /games/new
  def new; end

  # POST /games
  def create; end

  # GET /games/:id/edit
  def edit; end

  # PATCH /games/:id
  def update; end

  # DELETE /games/:id
  def destroy; end

  # POST /games/:id/add_genre
  def add_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])
    game.genres << genre
  end

  # DELETE /games/:id/remove_genre
  def remove_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])
    game.genres.delete(genre)
  end

  # POST /games/:id/add_platform
  def add_platform
    game = Game.find(params[:id])
    platform = Platform.find(params[:platform_id])
    game.platforms << platform
  end

  # DELETE /games/:id/remove_platform
  def remove_platform
    game = Game.find(params[:id])
    platform = Platform.find(params[:platform_id])
    game.platforms.delete(platform)
  end
end
