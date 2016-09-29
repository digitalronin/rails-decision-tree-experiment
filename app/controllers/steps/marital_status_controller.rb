class Steps::MaritalStatusController < StepController
  def edit
    super
    @form_object = MaritalStatusForm.new person: @person, marital_status: @person.marital_status
  end

  def update
    update_and_advance2 :marital_status, MaritalStatusForm
  end
end
