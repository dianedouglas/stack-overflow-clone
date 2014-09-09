class VotesController <ApplicationController

  before_filter :authorize, only: [:create]

  def create
    @vote = Vote.new(:answer_id => params[:answer_id])
    @vote.user_id = current_user.id
    if @vote.save
      respond_to do |format|
        format.js
      end
      # redirect_to question_path(params[:question_id])
    else
      flash[:notice] = "try again loser"
      redirect_to question_path(params[:question_id])
    end

  end

end
