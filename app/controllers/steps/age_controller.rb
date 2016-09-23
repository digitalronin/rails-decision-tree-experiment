class Steps::AgeController < StepController
  def update
    update_and_advance :age
  end
end
