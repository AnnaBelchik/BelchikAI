class ServicesController < ApplicationController
  before_action :set_main_data
  before_action :set_service, only: :show

  def show; end

  private

  def set_service
    @service = Service.find(params[:id])
  end
end
