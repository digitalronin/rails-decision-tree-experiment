class MaritalStatusForm
  include Virtus.model
  include ActiveModel::Validations

  attribute :marital_status, String
  validates :marital_status, presence: true

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
    person.update marital_status: marital_status
  end
end
