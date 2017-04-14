require 'dockingstation'
require 'bike'

describe DockingStation do

  describe '#dock' do
    let(:bike) {double :bike}
    it {is_expected.to respond_to(:dock).with(1).argument}
    it 'docks a bike' do
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'returns a bike that has been docked' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
    it 'raises an error when dockingstation is full' do
      (subject.capacity).times { subject.dock(bike) }
      expect{subject.dock(bike)}.to raise_error(RuntimeError)
    end
  end

  describe '#release_bike' do
    let(:bike) {double :bike}
    it {is_expected.to respond_to :release_bike}
    it 'raises an error when no bikes' do
      expect{subject.release_bike}.to raise_error(RuntimeError)
    end
    it 'releases a bike that works' do
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock bike
      bike = subject.release_bike
      expect(bike).not_to be_broken
    end
    it 'doesnt release a broken bike' do
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error(RuntimeError)
    end
  end

  describe '#initialize' do
    it 'sets capacity' do
      expect(subject.capacity).to be DockingStation::DEFAULT_CAPACITY
    end
  end
end
