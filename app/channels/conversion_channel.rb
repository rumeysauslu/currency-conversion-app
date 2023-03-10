# frozen_string_literal: true

class ConversionChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'conversion_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
