class StepController < ApplicationController
  def edit
    @person = Person.find params[:id]
    @next_step = params[:next_step]
  end

  private

  def update_and_advance(attr, opts = {})
    person = Person.find params[:id]

    hash = params.fetch(:person).permit(attr)
    next_step = params[:next_step].blank? ? false : params[:next_step]

    person.update hash

    # if we are reusing a step (e.g. income, income2, income3)
    # we need to rename the 'income' attribute to 'income2' (or whatever) for the
    # DecisionTree#destination call
    # i.e. { income: "high" } -> { income2: "high" }
    hash = opts[:as] ? { opts[:as] => hash[attr] } : hash

    redirect_to DecisionTree.new(object: person, step: hash, next_step: next_step).destination
  end

  def update_and_advance2(attr, form_class, opts = {})
    person = Person.find params.fetch(:id)
    hash = params.fetch(:form_object, {})
    @form_object = form_class.new hash.merge(person: person)
    @next_step = params[:next_step].blank? ? false : params[:next_step]

    if @form_object.save
      # if we are reusing a step (e.g. income, income2, income3)
      # we need to rename the 'income' attribute to 'income2' (or whatever) for the
      # DecisionTree#destination call
      # i.e. { income: "high" } -> { income2: "high" }
      hash = opts[:as] ? { opts[:as] => hash[attr] } : hash

      # TODO: do we have the updated person, via @form_object.person?
      redirect_to DecisionTree.new(object: person, step: hash, next_step: @next_step).destination
    else
      render :edit
    end
  end
end
