# Initializes the winnings and losses on the players balance
class Money
  def initialize(balance, cps)
    @balance = balance
    @cps = cps
  end

  def balance
    @balance = gets.chomp.to_i
  end

  def cps
    @cps = 1
  end

  def lose
    @balance - @cps
  end

  def win
    @balance + (@cps * 2)
  end
end
