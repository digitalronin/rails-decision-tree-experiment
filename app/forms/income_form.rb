class IncomeForm
  include Virtus.model
  include ActiveModel::Validations

  attribute :income, String
  validates :income, presence: true

  attr_accessor :person

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persisted?
    false
  end

  private

  def persist!
    person.update income: income
  end
end
