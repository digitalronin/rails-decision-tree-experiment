class Steps::Income3Controller < StepController
  def edit
    super
    render "steps/income/edit"
  end

  def update
    update_and_advance :income, as: :income3
  end
end
