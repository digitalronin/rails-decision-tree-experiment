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
end
