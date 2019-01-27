class PrimeNumberGenerator
	require_relative 'prime'
	include Prime

	def initialize
		@stored_primes = Array.new
	end

	def run
		puts "Enter first number"
		value_1 = gets.chomp
		puts "Enter second number"
		value_2 = gets.chomp

		unless is_numeric(value_1) && is_numeric(value_2)
			puts "Error: perhaps one or both of your range values are invalid: try again"
		else
			generate(value_1.to_i, value_2.to_i)
			puts "These are all #{stored_primes.length} prime numbers "\
				"between #{value_1} and #{value_2}: #{stored_primes.join(', ')}"
		end
	end

	private

	def is_numeric value
		true if Integer(value) != nil rescue false
	end

end

PrimeNumberGenerator.new.run if __FILE__ == $0