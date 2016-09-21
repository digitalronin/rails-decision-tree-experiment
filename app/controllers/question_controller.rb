class QuestionController < ApplicationController
  def edit
    @person = Person.find params[:id]
  end

  private

  def update_and_advance(sym)
    person = Person.find params[:id]
    step = params.fetch(:person).permit(sym)
    person.update step
    redirect_to DecisionTree.new(object: person, step: step).next
  end
end
