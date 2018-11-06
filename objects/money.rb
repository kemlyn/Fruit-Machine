# Initializes the winnings and losses on the players balance
class Money
  attr_reader :session, :spins

  def initialize(session)
    @session = session

    session[:balance] ||= 500
  end

  def balance
    session[:balance].to_i
  end

  def lose
    session[:balance] -= 1
  end

  def win
    session[:balance] += 2
  end

  def result
    result = Spins.new(self)

    lose(1)
    win(2)

    result
  end
end
