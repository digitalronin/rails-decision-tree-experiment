class AgeQuestionController < ApplicationController
  def edit
    @age_question = Person.find params[:id]
  end

  def update
    person = Person.find params[:id]
    person.update params.fetch(:person).permit(:age)
  end
end
