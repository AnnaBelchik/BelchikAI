class RecordsController < ApplicationController
  def cancel
    @record = Record.find(params[:record_id])
    if @record.cancel
      redirect_back(fallback_location: root_path)
    end
  end
end
