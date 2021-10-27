class ConvertsController < ApplicationController
  def index
    @converts = Convert.all
  end
end
