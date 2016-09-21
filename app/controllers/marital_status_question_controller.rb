class MaritalStatusQuestionController < QuestionController
  def update
    update_and_advance :marital_status
  end
end
