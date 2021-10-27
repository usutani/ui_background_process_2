class ConvertsController < ApplicationController
  def index
    @converts = Convert.all
    @convert = Convert.new
  end

  def create
    @convert = Convert.new(convert_params)
    if @convert.save
      FileConvertJob.perform_later(@convert)
    else
      render :create, status: :unprocessable_entity
    end
  end

  private
    def convert_params
      params.require(:convert).permit(:in_file)
    rescue ActionController::ParameterMissing
      nil
    end
end
