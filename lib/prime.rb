module Prime

	attr_accessor :stored_primes

	# Accepts two inputs and stores valid integers in that range that are prime in an array.
	# Handles inverse ranges.
	# Params:
	# + input_1 +:: first part of searched prime number range
	# + input_2 +:: second part of the searched prime number range
	def generate(input_1, input_2)
		num_range = [input_1, input_2]

		# positive? Numeric method is compatible with ruby v.2.3.0+ 
		return @stored_primes unless num_range.all? {|input| input.is_a?(Integer) && input >= 0}

		(num_range.min..num_range.max).each do |value|
			@stored_primes << value if is_prime(value)
		end
	end

	# Boolean: Determins whether input is a prime number. Returns false unless input is
	# a positive prime integer >=2.
	# Params:
	# + number +:: first part of searched prime number range
	def is_prime number
    	return false if !number.is_a?(Integer) || (number.even? && number != 2) || number < 2

    	(number/2).downto(3) { |value|
    		next if value.even?
    		return false if number % value == 0
    	}
    	true
	end

end