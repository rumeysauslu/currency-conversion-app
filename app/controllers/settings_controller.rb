# frozen_string_literal: true

class SettingsController < ApplicationController
  def index; end

  def update
    parameters = params.reject do |k, v|
      v.blank? || %w[controller stages action authenticity_token utf8 commit].include?(k)
    end
    parameters.each { |k, v| Setting.send("#{k}=", v.strip) unless k.nil? }
    redirect_to(root_path, notice: 'Settings saved')
  end
end
