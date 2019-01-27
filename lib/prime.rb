module Prime

	attr_accessor :stored_primes

	def generate(input_1, input_2)
		return @stored_primes unless input_1.is_a?(Integer) && input_2.is_a?(Integer)

		# positive? Numeric method is compatible with ruby v.2.3.0+ 
		return @stored_primes unless input_1 >= 0 && input_2 >= 0

		max = input_2 > input_1 ? input_2 : input_1
		min = input_2 < input_1 ? input_2 : input_1

		(min..max).each do |value|
			@stored_primes << value if is_prime(value)
		end
	end

	def is_prime number
    	return false unless number.is_a?(Integer)
    	return false if (number.even? && number != 2) || number < 2

    	(number/2).downto(3) { |value|
    		next if value.even?
    		if number % value == 0
    			return false
    		end
    	}
    	true
	end

end