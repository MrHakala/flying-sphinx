require 'logger'

module FlyingSphinx
  @logger       = Logger.new(STDOUT)
  @logger.level = Logger::INFO
  if ENV['VERBOSE_LOGGING'] && ENV['VERBOSE_LOGGING'] == 'true'
    @logger.level = Logger::DEBUG
  end

  def self.logger
    @logger
  end

  def self.logger=(logger)
    @logger = logger
  end
end

require 'faraday'
require 'faraday_middleware'
require 'riddle'
require 'riddle/0.9.9'
require 'pusher-client'

PusherClient.logger = FlyingSphinx.logger

require 'flying_sphinx/action'
require 'flying_sphinx/api'
require 'flying_sphinx/cli'
require 'flying_sphinx/configuration'
require 'flying_sphinx/controller'
require 'flying_sphinx/flag_as_deleted_job'
require 'flying_sphinx/index_request'
require 'flying_sphinx/setting_files'
require 'flying_sphinx/sphinx_configuration'
require 'flying_sphinx/version'

require 'flying_sphinx/delayed_delta' if defined?(ThinkingSphinx)
require 'flying_sphinx/railtie'       if defined?(Rails)
