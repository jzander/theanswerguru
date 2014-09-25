class AnswersController < ApplicationController
before_action :get_decision, :check_security

    def index
      @answers = @decision.answers
      @answer = Answer.new
      @criteria = @decision.criteria
    end

    def current_user
      if User && :user_id && session[:user_id]
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      else
        return false
      end
      rescue ActiveRecord::RecordNotFound
    end

    def new
      @answer = Answer.new
      @answers = @decision.answers
    end

    def show
      
    end

    def create
      #find our parent decision that we should attach to?
      @answer = Answer.new(
        params.require(:answer).permit(:rating, :text))
      
      #attaches this answer to a decision.

      @answer.decision = @decision
      if @answer.save
        redirect_to new_decision_answer_path(@decision.id)
      end

    end

    def update
      @answers = @decision.answers
      @answer = Answer.new
      @criteria = @decision.criteria

      respond_to do |format|
        if @answer.update(params.require(:rating).permit(:text))
          format.html { redirect_to @answer, notice: 'Feature was successfully updated.' }
          format.json { head :no_content }  
        else
          format.html { render action: 'edit' }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      Answer.find(params[:id]).destroy
      redirect_to new_decision_answer_path(@decision.id)
    end

  private
    def get_decision
       #find our parent decision that we should attach to
       @decision = Decision.find(params[:decision_id])
    end

    def check_security
      #if current_user && @decision.user == current_user
      if !current_user || @decision.user != current_user
          redirect_to home_path
      end
    end

end
