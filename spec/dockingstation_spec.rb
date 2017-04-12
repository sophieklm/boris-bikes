require 'dockingstation'
require 'bike'

describe DockingStation do
  bike = Bike.new
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'releases a bike that works' do
    expect(bike).to be_instance_of(Bike)
    expect(bike).to be_working
  end

  it 'docks a bike' do
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns a bike that has been docked' do
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it 'raises an error when no bikes' do
    expect{subject.release_bike}.to raise_error(RuntimeError)
  end

  it 'raises an error when dockingstation is full' do
    (DockingStation::DEFAULT_CAPACITY).times { subject.dock(bike) }
    expect{subject.dock(bike)}.to raise_error(RuntimeError)
  end

end
