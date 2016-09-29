class AgeForm < BaseForm
  attribute :age, String
  validates :age, presence: true

  private

  def persist!
    person.update age: age
  end
end
