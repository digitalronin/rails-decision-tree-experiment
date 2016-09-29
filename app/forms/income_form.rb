class IncomeForm < BaseForm
  attribute :income, String
  validates :income, presence: true

  private

  def persist!
    person.update income: income
  end
end
