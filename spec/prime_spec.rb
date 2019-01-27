require 'rspec'
require 'prime.rb'
require 'rspec/expectations'

RSpec.configure do |config|
	config.before(:all) do
		@test = Prime.new
	end
	config.after(:each) do
		@test.stored_primes.clear
	end
end

describe 'Testing the units in prime class' do

	it 'verifies prime object is not nil' do
    	expect(@test).not_to be_nil
    end

	it 'verifies stored primes is not empty' do
    	@test.store_primes_from_range(0, 10)
    	expect(@test.stored_primes).not_to be_empty
	end

	it "should raise an ArgumentError error for incomplete range input" do
		expect { @test.store_primes_from_range(0) }.to raise_error(ArgumentError)
	end

	it 'only accepts valid class type arguments' do
    	@test.store_primes_from_range("1", 10)
    	@test.store_primes_from_range(1, "10")
    	@test.store_primes_from_range('2', '3')
    	@test.store_primes_from_range(2.0, 10)
    	expect(@test.stored_primes).to be_empty
	end

	it 'accepts inverse ranges' do
		@test.store_primes_from_range(10, 0)
    	expect(@test.stored_primes).to eq [2,3,5,7]
	end

	it 'gets all prime numbers of small range of lower numbers' do
		@test.store_primes_from_range(0, 10)
    	expect(@test.stored_primes).to eq [2,3,5,7]
	end

	it 'gets all prime numbers of small range of large numbers' do
		@test.store_primes_from_range(7900, 7920)
    	expect(@test.stored_primes).to eq [7901, 7907, 7919]
	end

	it 'gets all prime numbers from 0 to 101' do
		@test.store_primes_from_range(0, 101)
		expect(@test.stored_primes).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 
			41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
	end

	it 'will not accept negative values as arguments' do
		@test.store_primes_from_range(-1, 10)
		@test.store_primes_from_range(10, -1)
    	expect(@test.stored_primes).to be_empty
	end

	it 'will not return any prime numbers if input values are less than 2' do
		@test.store_primes_from_range(0, 1)
    	expect(@test.stored_primes).to be_empty
	end

	it 'will return any prime number if max value is prime' do
		@test.store_primes_from_range(0, 2)
    	expect(@test.stored_primes).to eq [2]
	end

	it 'gets all prime numbers of inclusive range with prime' do
		@test.store_primes_from_range(3, 3)
    	expect(@test.stored_primes).to eq [3]
	end

	it 'gets all prime numbers of inclusive range without prime' do
		@test.store_primes_from_range(10, 10)
    	expect(@test.stored_primes).to be_empty
	end
end