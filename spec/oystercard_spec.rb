require 'oystercard'

describe Oystercard do

	describe '#initialize' do
		it 'should have a default balance of zero' do
			expect(subject.balance).to eq(0)
		end
	end

	describe '#top_up' do
		it { is_expected.to respond_to(:top_up).with(1).argument }

		it "raises an error when limit is exceeded" do
			max = Oystercard::LIMIT
			subject.top_up(max)
			expect{ subject.top_up 1 }.to raise_error "You cannot top up more than £#{max}"
		end
	end

	describe '#pay' do
		it { is_expected.to respond_to(:pay).with(1).argument }

		it 'deducts a fee everytime I pay for a journey' do
			subject.top_up(5)
			expect( subject.pay(3) ).to eq(2)
		end
	end

	describe '#touch_in' do 
		it { is_expected.to respond_to(:touch_in) }
	end

	describe '#touch_in' do 
		it { is_expected.to respond_to(:touch_out) }
	end
end
