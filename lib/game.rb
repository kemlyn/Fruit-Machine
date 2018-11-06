class Game
  class Result
    attr_reader :game, :result

    def initialize(game)
      @game   = game
      @result = Array.new(3) do
        positions[rand(positions.length)]
      end
    end

    def [](index)
      @result[index]
    end

    def prize
      string  = result.map { |result| result[:name] }.join
      matched = game.prize_table.detect { |p| p[:pattern].match(string) }
      matched ? matched[:value] : nil
    end

    protected

    def positions
      @positions ||= game.rules.map { |position| Array.new(position[:weight], position) }.flatten
    end
  end

  class Wallet
    attr_reader :session

    def initialize(session)
      @session = session

      session[:balance] ||= 500
    end

    def deduct_wager(amount)
      return unless amount

      session[:balance] -= amount
    end

    def credit_prize(amount)
      return unless amount

      session[:balance] += amount
    end

    def balance
      session[:balance]
    end
  end

  attr_reader :rules, :wallet

  def initialize(rules, session)
    @rules  = rules
    @wallet = Wallet.new(session)
  end

  def prize_table
    @prize_table ||= rules.map do |position|
      position[:value].reverse.each_with_index.map do |value, index|
        next if value.zero?

        {
          value:   value,
          pattern: /^(#{position[:name]}){#{3 - index}}/,
          label:   "#{3 - index}x #{position[:name]}"
        }
      end
    end.flatten.compact
  end

  def spin!
    result = Result.new(self)

    wallet.deduct_wager(1)
    wallet.credit_prize(result.prize)

    result
  end

  def balance
    wallet.balance
  end
end