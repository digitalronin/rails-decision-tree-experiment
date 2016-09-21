class IncomeQuestionController < ApplicationController
  def edit
    @person = Person.find params[:id]
  end

  def update
    person = Person.find params[:id]
    step = params.fetch(:person).permit(:income)
    person.update step
    redirect_to DecisionTree.new(object: person, step: step).next
  end
end
