class StaticController < ApplicationController
  def index
    render json: { status: 'Welcome to the Tracking App API' }
  end
end
