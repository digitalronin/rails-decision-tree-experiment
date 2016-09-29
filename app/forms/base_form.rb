class BaseForm
  include Virtus.model
  include ActiveModel::Validations

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
    raise "BaseForm#persist! was called. This should be overridden in the subclass"
  end
end
