require 'sinatra'
require_relative 'objects/game.rb'

set :bind, '0.0.0.0'
set :public_folder, 'public/images'

use Rack::Session::Cookie, key:    'rack.session',
                           path:   '/',
                           secret: 'RANDOMSTRING'

OPTIONS = %w[avo apple bannana orange jackpot].freeze

get '/' do
  puts session.inspect
  @machine ||= Game.new(OPTIONS, session)
  @result = @machine.play

  erb :index
end
