class AddDecisionIdToCriteriaAnswers < ActiveRecord::Migration
  def change
    add_column :criteria_answers, :decision_id, :integer
  end
end
