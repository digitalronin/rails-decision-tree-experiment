class AgeForm
  include Virtus.model
  include ActiveModel::Validations

  attribute :age, String
  validates :age, presence: true

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
    person.update age: age
  end
end
