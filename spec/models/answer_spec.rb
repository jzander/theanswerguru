require 'rails_helper'

RSpec.describe Answer, :type => :model do
  before { @answer = Answer.create!(text: "testing", decision_id: 3)}
  subject { @answer }

  validates :test, presence: {message: "you need an answer" }
  validates :name, numericality: {greater_than_or_equal_to: 1}

  # pending "add some examples to (or delete) #{__FILE__}"
end
