# running and initializing the machine
class Game
  # Spins the wheel and finds the outcome
  class Spins
    def spin1
      @spin1 ||= OPTIONS[rand(OPTIONS.length)]
    end

    def spin2
      @spin2 ||= OPTIONS[rand(OPTIONS.length)]
    end

    def spin3
      @spin3 ||= OPTIONS[rand(OPTIONS.length)]
    end

    def outcome(_spin)
      if [spin1, spin2, spin3].uniq.count == 1
        :win
      else
        :lose
      end
    end
  end
  # Initializes the winnings and losses on the players balance
  class Money
    attr_reader :session

    def initialize(session)
      @session = session

      session[:balance] ||= 500
    end

    def lose(cash)
      return unless cash

      session[:balance] -= cash
    end

    def win(cash)
      return unless cash

      session[:balance] += cash
    end

    def balance
      session[:balance]
    end
  end

  attr_reader :spins, :money

  def initialize(spins, session)
    @spins = spins
    @money = Money.new(session)
  end

  def play!
    result = Spins.new

    @money.lose(1)
    @money.win(2)

    result
  end

  def balance
    @money.balance
  end
end
