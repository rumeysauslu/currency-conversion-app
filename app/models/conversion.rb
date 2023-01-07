# frozen_string_literal: true

class Conversion < ApplicationRecord
  # validations
  validates :base_currency, :target_currency, presence: true
  validates :base_currency, uniqueness: { scope: :target_currency }

  # callbacks
  before_create :set_currency

  private

  def set_currency
    self.base_currency = base_currency.upcase
    self.target_currency = target_currency.upcase
  end
end
