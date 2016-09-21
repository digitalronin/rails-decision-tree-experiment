class MaritalStatusQuestionController < ApplicationController
  def edit
    @marital_status_question = Person.find params[:id]
  end

  def update
    person = Person.find params[:id]
    person.update params.fetch(:person).permit(:marital_status)
  end
end
