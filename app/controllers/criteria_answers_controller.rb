class CriteriaAnswersController < ApplicationController

  def current_user
    if User && :user_id && session[:user_id]
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      return false
    end
    rescue ActiveRecord::RecordNotFound
  end

  def index
    
  end

  def new

    @decision = Decision.find(params[:id])
    # passed_id = params(:id)
    # decision = decisions.where(:id = passed_id)
  
    @decision.answers.each do |a|
      @decision.criteria.each do |c|
        onerec = CriteriaAnswer.new
        onerec.decision_id  = a.id
        onerec.criterion_id = c.id
        onerec.rating       = 0
        onerec.save
      end
    end

    redirect_to edit_criteria_answer_path
    ## go to edit view where user can rate 

  end

  def create
   # var myanswerid = decision.answers.id
    # for each decision answer loop through |variable| 
      # var myanswerid = variable[:id]
    #   for each decision criterion loop through |variable|
    #       var mycriteriaid = decision.criteria.id
        #     criteria_answer.create
        #      myanswerid
        #        mycriteriaid
        #       .save
       # next decision criteria
       # next answer criteria
       # redirect to edit

    criteria_answer = CriteriaAnswer.new(criteria_answer_params)
    
    if criteria_answer.save
      redirect_to crit_answer_path
    end

  end

  def edit
      @decision = Decision.find(params[:id])
  end

  def update
    if @criteria_answer.update(criteria_answer_params)
    # save rating and redirects to index
      redirect_to crit_answer_path
    end
  end

  def show

  end

private
  def get_decision
     #find our parent decision that we should attach to
     @decision = Decision.find(params[:decision_id])
  end

  def criteria_answer_params
    params.require(:criteria_answer).permit(:rating, :criteria_id, :answer_id, :id)
  end

end
