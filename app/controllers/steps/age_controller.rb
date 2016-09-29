class Steps::AgeController < StepController
  def edit
    super
    @form_object = AgeForm.new person: @person, age: @person.age
  end

  def update
    update_and_advance2 :age, AgeForm
  end
end
