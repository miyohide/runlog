class WelcomeController < ApplicationController
  def index
    render json: [1, 2, 3, 4, 5, 6]
  end
end
