class Steps::IncomeController < StepController
  def update
    update_and_advance :income
  end
end
