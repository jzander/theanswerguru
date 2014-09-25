class CriteriaAnswer < ActiveRecord::Base
  # connection.execute("SQL query") 
  belongs_to :answer
  belongs_to :criterion

  # SELECT answers.text
  #    CAST( SUM(criteria.importance * criteria_answers.rating) AS FLOAT) / (SELECT SUM(importance)*10 FROM criteria WHERE decision_id = user_id) AS "total_val"
  #     FROM answers
  #       INNER JOIN criteria_answers ON answers.id = criteria_answers.answer_id
  #       INNER JOIN criteria ON criteria.id = criteria_answers.criterion_id
  #     GROUP BY answers.text
  #     ORDER BY 2 DESC;
  
end
