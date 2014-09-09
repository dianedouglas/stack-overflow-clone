class VotesController <ApplicationController


  def create
    @vote = Vote.new(:answer_id => params[:answer_id])
    @vote.user_id = current_user.id
    if @vote.save
      redirect_to question_path(params[:question_id])
    else
      flash[:notice] = "try again loser"
      redirect_to question_path(params[:question_id])
    end

  end

end
