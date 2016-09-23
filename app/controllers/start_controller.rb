class StartController < ApplicationController
  def index
    @person = Person.first
  end
end
