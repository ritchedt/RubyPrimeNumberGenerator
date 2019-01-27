class PrimeNumberGenerator
	require_relative 'prime'
	include Prime

	def initialize
		@stored_primes = Array.new
	end

end

run = PrimeNumberGenerator.new
run.generate(ARGV[0].to_i, ARGV[1].to_i)
puts run.stored_primes
run.stored_primes.clear