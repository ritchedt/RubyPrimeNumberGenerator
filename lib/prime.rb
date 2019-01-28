module Prime

	attr_accessor :stored_primes

	def generate(input_1, input_2)
		num_range = [input_1, input_2]

		# positive? Numeric method is compatible with ruby v.2.3.0+ 
		return @stored_primes unless num_range.all? {|input| input.is_a?(Integer) && input >= 0}

		(num_range.min..num_range.max).each do |value|
			@stored_primes << value if is_prime(value)
		end
	end

	def is_prime number
    	return false if !number.is_a?(Integer) || (number.even? && number != 2) || number < 2

    	(number/2).downto(3) { |value|
    		next if value.even?
    		return false if number % value == 0
    	}
    	true
	end

end