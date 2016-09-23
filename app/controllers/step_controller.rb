class StepController < ApplicationController
  def edit
    @person = Person.find params[:id]
    @next_step = params[:next_step]
  end

  private

  def update_and_advance(sym)
    person = Person.find params[:id]
    attr = params.fetch(:person).permit(sym)
    next_step = params[:next_step].blank? ? false : params[:next_step]
    person.update attr
    redirect_to DecisionTree.new(object: person, step: attr, next_step: next_step).next
  end
end
