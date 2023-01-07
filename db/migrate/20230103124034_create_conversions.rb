# frozen_string_literal: true

class CreateConversions < ActiveRecord::Migration[7.0]
  def change
    create_table :conversions do |t|
      t.string :base_currency
      t.string :target_currency
      t.decimal :rate

      t.timestamps
    end
  end
end
