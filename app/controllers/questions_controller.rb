class QuestionsController < ApplicationController
  def show
  	# @question = Question.find_by({id: ''})
    @tag = Tag.find_by_name params[:name]
    render :json => @tag
  end

  def easy
  	@tag = Tag.find_by({name:"easy"})
	  render plain @tag.name
  end

  def medium
  	@tag = Tag.find_by({name:"medium"})
  	render plain: @tag
  end

  def hard
  	@tag = Tag.find_by({name:"hard"})
  	render plain: @tag
  end

end
