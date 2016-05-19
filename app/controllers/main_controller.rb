class MainController < ApplicationController
	before_action :is_authenticated?
 before_action :current_user

  def index
  end
end
