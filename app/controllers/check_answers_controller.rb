class CheckAnswersController < ApplicationController
  def edit
    @person = Person.find params[:id]
  end
end
