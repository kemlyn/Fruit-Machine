require 'sinatra'
require_relative 'objects/money.rb'
require_relative 'objects/spins.rb'

set :bind, '0.0.0.0'
set :public_folder, 'public/images'

get '/' do
  @spin = Spins.new
  @outcome = @spin.play(params[:option])
  erb :index
end

post '/' do
  @spin = Spins.new
  @outcome = @spin.play(params[:option])
  erb :index
end
