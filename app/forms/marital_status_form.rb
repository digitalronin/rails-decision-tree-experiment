class MaritalStatusForm < BaseForm
  attribute :marital_status, String
  validates :marital_status, presence: true

  private

  def persist!
    person.update marital_status: marital_status
  end
end
