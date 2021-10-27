class ConvertsController < ApplicationController
  def index
    @converts = Convert.all
    @convert = Convert.new
  end

  def create
    @convert = Convert.new(convert_params)
    @convert.save
    redirect_to converts_url
  end

  private
    def convert_params
      params.require(:convert).permit(:in_file)
    rescue ActionController::ParameterMissing
      nil
    end
end
