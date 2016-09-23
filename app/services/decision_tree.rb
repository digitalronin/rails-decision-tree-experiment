class DecisionTree
  include Rails.application.routes.url_helpers
  include ApplicationHelper

  def initialize(params)
    @object = params.fetch(:object)
    @step = params.fetch(:step)
    @next_step = params.fetch(:next_step, false)
  end

  def destination
    return @next_step if @next_step

    case question.to_sym
    when :age
      after_age_question
    when :income
      after_income_question
    when :income2
      after_income2_question
    when :income3
      after_income3_question
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
      goto_question :income3
    when m.fetch(:married)
      goto_question :income2
    end
  end

  def after_income2_question
    i = ANSWERS.fetch(:income)

    case answer
    when i.fetch(:high)
      endpoint "rich married adult"
    when i.fetch(:low)
      endpoint "poor married adult"
    end
  end

  def after_income3_question
    i = ANSWERS.fetch(:income)

    case answer
    when i.fetch(:high)
      endpoint "rich single adult"
    when i.fetch(:low)
      endpoint "poor single adult"
    end
  end

  #----------------------

  def goto_question(step)
    step_path step, @object
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
