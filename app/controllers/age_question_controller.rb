class AgeQuestionController < ApplicationController
  def edit
    @age_question = Person.find params[:id]
  end

  def update
    person = Person.find params[:id]
    step = params.fetch(:person).permit(:age)
    person.update step
    redirect_to DecisionTree.new(object: person, step: step).next
  end
end
