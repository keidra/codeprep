class QuestionsController < ApplicationController
  def show
  	# @question = Question.find_by({id: ''})
    @tag = Tag.find_by_name params[:name]
    render :json => @tag
  end
end
