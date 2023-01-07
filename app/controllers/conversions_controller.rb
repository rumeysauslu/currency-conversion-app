# frozen_string_literal: true

class ConversionsController < ApplicationController
  def index
    @conversions = Conversion.all.order(id: :desc)
  end

  def new
    @conversion = Conversion.new
  end

  def create
    @conversion = Conversion.new(conversion_params)
    @conversion.save ? (redirect_to root_path, notice: 'Conversion created successfully') : render(:new)
  end

  def destroy
    @conversion = Conversion.find(params[:id])
    @conversion.destroy ? redirect_with('Conversion deleted successfully') : redirect_with('Conversion not deleted')
  end

  private

  def conversion_params
    params.require(:conversion).permit(:base_currency, :target_currency, :rate)
  end

  def redirect_with(message)
    redirect_to(root_path, notice: message)
  end
end
