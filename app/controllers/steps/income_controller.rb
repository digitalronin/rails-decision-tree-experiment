class Steps::IncomeController < StepController
  def edit
    super
    @form_object = IncomeForm.new person: @person, income: @person.income
  end

  def update
    update_and_advance2 :income, IncomeForm
  end
end
