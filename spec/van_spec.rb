require 'van'
require 'support/shared_examples_for_bike_container'

describe Van do
  it_behaves_like BikeContainer

  it 'collects broken bikes' do
    bike = double :bike
    subject.add_bike bike
    expect(bike).to receive :broken?
    subject.deliver_bikes
  end
end
