require 'dockingstation'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it 'releases a bike that works' do
    bike = subject.release_bike
    expect(bike).to be_instance_of(Bike)
    expect(bike).to be_working
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

end
