# frozen_string_literal: true

class AddUniqueIndexForConversion < ActiveRecord::Migration[7.0]
  def change
    add_index :conversions, %i[base_currency target_currency], unique: true
  end
end
