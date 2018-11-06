OPTIONS = %w[avo apple bannana orange jackpot].freeze
# running and initializing the machine
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

  def play(_spin)
    if [spin1, spin2, spin3].uniq.count == 1
      :win
    else
      :lose
    end
  end
end
