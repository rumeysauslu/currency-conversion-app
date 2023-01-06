# frozen_string_literal: true

class SettingsController < ApplicationController
  def index; end

  def update
    parameters = params.reject { |k, v| v.blank? || %w[controller stages action authenticity_token utf8 commit].include?(k) }
    parameters.each { |k, v| Setting.send("#{k}=", v.strip) unless k.nil? }
    redirect_to(settings_path, notice: 'Settings saved')
  end
end
