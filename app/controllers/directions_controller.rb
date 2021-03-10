class DirectionsController < ApplicationController
  before_action :set_main_data
  before_action :set_direction, only: :show

  def show; end

  private

  def set_direction
    @direction = Direction.find(params[:id])
  end
end
