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
    @conversion.save ? redirect_to(root_path, notice: 'Added') : render(:new)
  end

  private

  def conversion_params
    params.require(:conversion).permit(:base_currency, :target_currency, :rate)
  end
end
