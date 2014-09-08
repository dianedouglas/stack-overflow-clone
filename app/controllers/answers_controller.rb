class AnswersController <ApplicationController


  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    if @answer.save
      redirect_to question_path(params[:question_id])
      flash[:notice] = "Good Answer Bro!"
    else
      redirect_to question_path(params[:question_id])
      flash[:notice] = "Fill in an answer before submitting!"

    end
  end


private
  def answer_params
    params.require(:answer).permit(:answer)
  end

end
