class QuestionsController < ApplicationController
  def show
  	# @question = Question.find_by({id: ''})
    @tag = Tag.find_by_name params[:name]
    render :json => @tag
  end

  def easy
  	@tag = Tag.find_by_name "easy"
  	render = :json => @tag
  end

  def medium
  	@tag = Tag.find_by_name "meduim"
  	render = :json => @tag
  end

  def hard
  	@tag = Tag.find_by_name "hard"
  	render = :json => @tag
  end

end
