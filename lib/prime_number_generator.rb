class PrimeNumberGenerator
	require_relative 'prime'
	include Prime

	def initialize
		@stored_primes = Array.new
	end

	def run
		loop do
			puts "\n(r) primes in range\n(p) is your number prime\n(e) exit\n"
			menu_nav = gets.chomp
			case menu_nav
			when 'r'
				puts "Enter first number"
				first = gets.chomp
				puts "Enter second number"
				second = gets.chomp

				unless is_numeric(first) && is_numeric(second)
					puts "Error: perhaps one or both of your range values are invalid: try again"
				else
					generate(first.to_i, second.to_i)
					puts "These are all prime numbers "\
						"between #{first} and #{second}: (#{stored_primes.length} total) #{stored_primes.join(', ')}"
					stored_primes.clear
				end
			when 'p'
				puts "Enter number"
				prime_input = gets.chomp
				unless is_numeric(prime_input)
					puts "Error: perhaps your value is invalid: try again"
				else
					puts "Your number #{prime_input} is prime? #{is_prime(prime_input.to_i)}"
				end
			when 'e'
				puts "bye"
				break
			end
		end
	end

	private

	def is_numeric value
		true if Integer(value) != nil rescue false
	end

end

PrimeNumberGenerator.new.run if __FILE__ == $0