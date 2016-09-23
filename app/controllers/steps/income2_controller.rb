class Steps::Income2Controller < StepController
  def edit
    super
    render "steps/income/edit"
  end

  def update
    update_and_advance :income, as: :income2
  end
end
