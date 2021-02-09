class Oystercard
	LIMIT = 90
	MINIMUM_FARE = 1
	attr_reader :balance, :in_journey

	def initialize
		@balance = 0
		@in_journey = false
	end

	def top_up(amount)
		fail "You cannot top up more than £#{LIMIT}" if amount + @balance > LIMIT
		@balance += amount
	end

	def touch_in
		fail "You need at least £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
		@in_journey = true
	end

	def touch_out
		pay(MINIMUM_FARE)
		@in_journey = false
	end

	def in_journey?
		@in_journey
	end

private

	def pay(amount)
		@balance -= amount
	end

end


# card = Oystercard.new
# card.touch_in
# fail
