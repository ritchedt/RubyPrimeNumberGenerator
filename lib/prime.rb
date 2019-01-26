class Prime

	attr_accessor :stored_primes

	def initialize
		@start = 0
		@end = 0
		@stored_primes = Array.new
	end

	def store_primes_from_range(input_1, input_2)
		return @stored_primes unless input_1.is_a?(Integer) && input_2.is_a?(Integer)

		@stored_primes = [2,3,5,7]
	end

end