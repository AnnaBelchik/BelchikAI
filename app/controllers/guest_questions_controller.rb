class GuestQuestionsController < ApplicationController
  def create
    @guest_question = GuestQuestion.new(guest_questions_params)

    respond_to do |format|
      if @guest_question.save
        flash[:alert] = 'Всё збс'
        format.html { redirect_to root_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def guest_questions_params
    params.require(:guest_question).permit(:name, :phone, :question)
  end
end
