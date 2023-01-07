# frozen_string_literal: true

every 1.minute do
  rake 'conversion:set_rates'
end
