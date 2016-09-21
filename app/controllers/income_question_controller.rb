class IncomeQuestionController < ApplicationController
  def edit
    @income_question = Person.find params[:id]
  end

  def update
    person = Person.find params[:id]
    person.update params.fetch(:person).permit(:income)
  end
end
