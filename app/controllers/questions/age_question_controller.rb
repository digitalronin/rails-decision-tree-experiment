class Questions::AgeQuestionController < QuestionController
  def update
    update_and_advance :age
  end
end
