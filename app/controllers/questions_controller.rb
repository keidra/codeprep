class QuestionsController < ApplicationController
  def show
  	@creature = Creature.find params[:id]
  	render :json => @creature
  end
end
