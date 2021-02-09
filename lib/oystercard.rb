class Oystercard
	LIMIT = 90
	attr_reader :balance, :in_journey

	def initialize
		@balance = 0
		@in_journey = false
	end

	def top_up(amount)
		fail "You cannot top up more than £#{LIMIT}" if amount + @balance > LIMIT
		@balance += amount
	end

	def pay(amount)
		@balance -= amount
	end

	def touch_in
	end

	def touch_out
	end
end


# card = Oystercard.new
# card.top_up(5)
# card.touch_in
# return => true
# card.touch_out
# return => false
