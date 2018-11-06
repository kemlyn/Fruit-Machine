require 'sinatra'
require_relative 'objects/money.rb'
require_relative 'objects/spins.rb'


set :bind, '0.0.0.0'
set :public_folder, 'public/images'

use Rack::Session::Cookie, key:    'rack.session',
                           path:   '/',
                           secret: 'RANDOMSTRING'

get '/' do
  @balance ||= Money.new(session)
  @current = @balance.balance

  @spin = Spins.new
  @outcome = @spin.play(params[:option])
  erb :index
end
