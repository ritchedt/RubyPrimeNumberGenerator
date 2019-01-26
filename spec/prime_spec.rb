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

	it 'gets all prime numbes in a small range' do
		@test.store_primes_from_range(0, 10)
    	expect(@test.stored_primes).to eq [2,3,5,7]
	end

end