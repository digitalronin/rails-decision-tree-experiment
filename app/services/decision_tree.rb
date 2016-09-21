class DecisionTree
  include Rails.application.routes.url_helpers

  def initialize(params)
    @object = params.fetch(:object)
    @step = params.fetch(:step)
  end

  def next
    case question.to_sym
    when :age
      after_age_question
    when :income
      after_income_question
    when :marital_status
      after_marital_status_question
    end
  end

  private

  def after_age_question
    case answer
    when "< 18"
      goto_question :income
    when "18 - 35"
      endpoint "young adult"
    when "36 - 55"
      goto_question :marital_status
    when "> 55"
      endpoint "pensioner"
    end
  end

  def after_income_question
    case answer
    when "high"
      endpoint "rich kid"
    when "low"
      endpoint "poor kid"
    end
  end

  def after_marital_status_question
    case answer
    when "single"
      endpoint "single adult"
    when "married"
      endpoint "married adult"
    end
  end

  def goto_question(q)
    url_for host: "localhost:3000", action: :edit, controller: [q, "_question"].join, id: @object
  end

  def endpoint(str)
    decision_path str
  end

  def question
    @step.keys.first
  end

  def answer
    @step.values.first
  end
end
