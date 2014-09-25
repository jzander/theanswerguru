class Decision < ActiveRecord::Base
	belongs_to :user
	has_many :criteria
	has_many :answers

  has_many :criteria_answers, through: :answers

  accepts_nested_attributes_for :criteria
  accepts_nested_attributes_for :answers

  def answer_result

      # for each answer, 

      #   add the result of each [criteria weight * answer-criteria rate]
        
      #   then compare the total answer value to all answer values
        
      #   present the answer with the highest value.

      #show results

    Answer.find_by_sql("
      SELECT answers.id, answers.text, 
        CAST( 
          SUM
          (criteria.importance * criteria_answers.rating) AS FLOAT) / 
          (SELECT SUM(importance)*10 FROM criteria WHERE decision_id = #{self.id}) 
        AS \"total_val\"

        FROM answers
          INNER JOIN criteria_answers ON answers.id = criteria_answers.answer_id
          INNER JOIN criteria ON criteria.id = criteria_answers.criterion_id
          
        WHERE criteria.decision_id = #{self.id} AND answers.decision_id = #{self.id}
        GROUP BY answers.id, answers.text ORDER BY 2 DESC;")

    #SQL Query takes all answers with all criteria ( importance and ratings ) and for each criteria for each answer, multiplies the criteria_answer rating by the criteria importance to result in a total value for each answer
  end

end
