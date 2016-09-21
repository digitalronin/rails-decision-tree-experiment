class DecisionController < ApplicationController
  def show
    @decision = params[:id]
  end
end
