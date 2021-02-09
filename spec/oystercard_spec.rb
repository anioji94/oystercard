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
		
		it 'should update the status of the card to "in journey"' do
			subject.touch_in
			expect( subject.in_journey ).to be true
		end
	end

	describe '#touch_out' do 
		it { is_expected.to respond_to(:touch_out) }

		it 'should update the status of the card to "not in journey"' do
			subject.touch_in
			subject.touch_out
			expect(subject.in_journey).to be false
		end
	end

	describe '#in_journey' do 
		it { is_expected.to respond_to(:in_journey) }
		
		it 'should not be in a journey by default' do
			expect(subject.in_journey).to be false
		end
	end
end
