require 'dockingstation'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it 'releases a bike that works' do
    bike = subject.release_bike
    expect(bike).to be_instance_of(Bike)
    expect(bike).to be_working
  end
end
