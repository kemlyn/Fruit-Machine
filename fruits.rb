require 'sinatra'
require_relative 'objects/game.rb'

enable :sessions

set :bind, '0.0.0.0'
set :public_folder, 'public/images'

OPTIONS = %w[avo apple bannana orange].freeze

get '/' do
  @machine ||= Game.new(OPTIONS, session)
  @result = @machine.play!

  erb :index
end
