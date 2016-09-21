class DecisionTree
  include Rails.application.routes.url_helpers

  def initialize(params)
    @object = params.fetch(:object)
    @step = params.fetch(:step)
  end

  def next
    case question
    when "age"
      after_age
    when "income"
      after_income
    when "marital_status"
      after_marital_status
    end
  end

  private

  def after_age
    case answer
    when "< 18"
      edit_income_question_path(@object)
    when "18 - 35"
      decision_path("young adult")
    when "36 - 55"
      edit_marital_status_question_path(@object)
    when "> 55"
      decision_path("pensioner")
    end
  end

  def after_income
    case answer
    when "high"
      decision_path("rich kid")
    when "low"
      decision_path("poor kid")
    end
  end

  def after_marital_status
    case answer
    when "single"
      decision_path "single adult"
    when "married"
      decision_path "married adult"
    end
  end

  def question
    @step.keys.first
  end

  def answer
    @step.values.first
  end
end
