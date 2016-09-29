class Steps::AgeController < StepController
  def edit
    person = Person.find params.fetch(:id)
    @age_form = AgeForm.new person: person, age: person.age
    @next_step = params[:next_step]
  end

  def update
    update_and_advance :age
  end

  private

  def update_and_advance(attr, opts = {})
    person = Person.find params.fetch(:id)
    hash = params.fetch(:age_form, {})
    @age_form = AgeForm.new hash.merge(person: person)
    @next_step = params[:next_step].blank? ? false : params[:next_step]

    if @age_form.save
      # if we are reusing a step (e.g. income, income2, income3)
      # we need to rename the 'income' attribute to 'income2' (or whatever) for the
      # DecisionTree#destination call
      # i.e. { income: "high" } -> { income2: "high" }
      hash = opts[:as] ? { opts[:as] => hash[attr] } : hash

      # TODO: do we have the updated person, via @age_form.person?
      redirect_to DecisionTree.new(object: person, step: hash, next_step: @next_step).destination
    else
      render :edit
    end
  end
end
