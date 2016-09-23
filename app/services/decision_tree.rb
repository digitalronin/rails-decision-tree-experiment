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
    a = ANSWERS.fetch(:age)

    case answer
    when a.fetch(:less_than_18)
      goto_question :income
    when a.fetch(:eighteen_to_35)
      endpoint "young adult"
    when a.fetch(:thirtysix_to_55)
      goto_question :marital_status
    when a.fetch(:over_55)
      endpoint "pensioner"
    end
  end

  def after_income_question
    i = ANSWERS.fetch(:income)

    case answer
    when i.fetch(:high)
      endpoint "rich kid"
    when i.fetch(:low)
      endpoint "poor kid"
    end
  end

  def after_marital_status_question
    m = ANSWERS.fetch(:marital_status)

    case answer
    when m.fetch(:single)
      endpoint "single adult"
    when m.fetch(:married)
      endpoint "married adult"
    end
  end

  #----------------------

  def goto_question(q)
    # TODO: remove hard-coded 'localhost:3000' - use request.host_with_port instead
    url_for host: "localhost:3000", action: :edit, controller: ["steps/", q].join, id: @object
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
