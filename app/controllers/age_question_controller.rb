class AgeQuestionController < ApplicationController
  def edit
    @age_question = Person.find params[:id]
  end

  def update
    @age_question = Person.find params[:id]
    @age_question.update params.fetch(:person).permit(:age)
  end
end
