class Steps::AgeController < QuestionController
  def update
    update_and_advance :age
  end
end
