require 'sinatra'

require_relative 'lib/game'

class FruitMachine < Sinatra::Base
  # Three reel prize table
  PRIZE_TABLE = [
    { name: 'Cherry',     value: [2, 4,  8],   weight: 25 },
    { name: 'Orange',     value: [0, 4,  8],   weight: 20 },
    { name: 'Lemon',      value: [0, 4,  8],   weight: 20 },
    { name: 'Strawberry', value: [0, 4,  20],  weight: 15 },
    { name: 'Apple',      value: [0, 4,  20],  weight: 15 },
    { name: 'Pear',       value: [0, 4,  40],  weight: 10 },
    { name: 'Melon',      value: [0, 12, 100], weight: 2 },
    { name: 'Bar',        value: [0, 20, 200], weight: 1 }
  ].freeze

  use Rack::Session::Cookie, key:    'rack.session',
                             path:   '/',
                             secret: 'RANDOMSTRING'

  get '/' do
    @game ||= Game.new(PRIZE_TABLE, session)
    @result = @game.spin!

    erb :index
  end
end