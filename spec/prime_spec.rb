require 'rspec'
require 'prime.rb'
require 'prime_number_generator.rb'
require 'rspec/expectations'

RSpec.configure do |config|
	config.before(:all) do
		@test = PrimeNumberGenerator.new
	end
	config.after(:each) do
		@test.stored_primes.clear
	end
end

describe 'Testing the units in prime class' do

	it 'verifies stored_primes value is not nil' do
    	expect(@test.stored_primes).not_to be_nil
    end

	it 'verifies stored primes are not empty' do
    	@test.generate(0, 10)
    	expect(@test.stored_primes).not_to be_empty
	end

	it "should raise an ArgumentError error for incomplete generate range input" do
		expect { @test.generate(0) }.to raise_error(ArgumentError)
	end

	it 'only accepts valid class type arguments for generate range input' do
    	@test.generate("1", 10)
    	@test.generate(1, "10")
    	@test.generate("t", 10)
    	@test.generate('2', '3')
    	@test.generate(2.0, 10)
    	expect(@test.stored_primes).to be_empty
	end

	it 'accepts inverse ranges' do
		@test.generate(10, 0)
    	expect(@test.stored_primes).to eq [2,3,5,7]
	end

	it 'gets all prime numbers of small range of lower numbers' do
		@test.generate(0, 10)
    	expect(@test.stored_primes).to eq [2,3,5,7]
	end

	it 'gets all prime numbers of small range of large numbers' do
		@test.generate(7900, 7920)
    	expect(@test.stored_primes).to eq [7901, 7907, 7919]
	end

	it 'gets all the first 26 prime numbers from 0 to 101' do
		@test.generate(0, 101)
		expect(@test.stored_primes).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 
			41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
		expect(@test.stored_primes.length).to eq 26
	end

	it 'will not accept negative values as range arguments' do
		@test.generate(-1, 10)
		@test.generate(10, -1)
		@test.generate(-10, -1)
    	expect(@test.stored_primes).to be_empty
	end

	it 'will not return any prime numbers if positive input values are less than 2' do
		@test.generate(0, 1)
    	expect(@test.stored_primes).to be_empty
	end

	it 'will return a prime number if max value is exactly 2' do
		@test.generate(0, 2)
    	expect(@test.stored_primes).to eq [2]
	end

	it 'gets all prime numbers of inclusive range with prime' do
		@test.generate(5, 5)
    	expect(@test.stored_primes).to eq [5]
	end

	it 'gets all prime numbers of inclusive range without prime' do
		@test.generate(10, 10)
    	expect(@test.stored_primes).to be_empty
	end

	it 'can determine if random number is prime' do
    	expect(@test.is_prime(17)).to be true
	end

	it 'can determine if random number is not prime' do
    	expect(@test.is_prime(20)).to be false
	end

	it 'is_prime will return true if value 2' do
    	expect(@test.is_prime(2)).to be true
	end

	it 'is_prime only accepts valid class type arguments' do
    	expect(@test.is_prime("5")).to be false
    	expect(@test.is_prime('5')).to be false
    	expect(@test.is_prime(5.0)).to be false
	end

	it 'is_prime will return false if positive value is less than 2' do
    	expect(@test.is_prime(1)).to be false
	end

	it 'is_prime will return false if value is a negative value' do
    	expect(@test.is_prime(-5)).to be false
	end

	it "should raise an ArgumentError error for incomplete is_prime input" do
		expect { @test.is_prime }.to raise_error(ArgumentError)
	end

end