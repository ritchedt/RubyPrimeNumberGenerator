class Prime

	attr_accessor :stored_primes

	def initialize
		@start = 0
		@end = 0
		@stored_primes = Array.new
	end

	def store_primes_from_range(input_1, input_2)
		return @stored_primes unless input_1.is_a?(Integer) && input_2.is_a?(Integer)

		# positive? Numeric method is compatible with ruby v.2.3.0+ 
		return @stored_primes unless input_1 >= 0 && input_2 >= 0

		max = input_2 > input_1 ? input_2 : input_1
		min = input_2 < input_1 ? input_2 : input_1

		@stored_primes = (2..max).to_a

		(2..Math.sqrt(max).floor).each_with_index do |value, index|
			current_prime = @stored_primes.at(index)
			@stored_primes.each do |num|
				if num % current_prime == 0 && current_prime != num
					@stored_primes.delete(num)
				end
			end
		end

		@stored_primes.delete_if {|value| value < min}
	end

end