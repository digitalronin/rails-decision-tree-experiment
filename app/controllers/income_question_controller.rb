class IncomeQuestionController < QuestionController
  def update
    update_and_advance :income
  end
end
