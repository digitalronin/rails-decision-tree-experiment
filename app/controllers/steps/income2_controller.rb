class Steps::Income2Controller < StepController
  def edit
    super
    @form_object = IncomeForm.new person: @person, income: @person.income
    render "steps/income/edit"
  end

  def update
    update_and_advance :income, IncomeForm, as: :income2, render: "steps/income/edit"
  end
end
