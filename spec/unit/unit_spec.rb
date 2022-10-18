require 'rails_helper'

RSpec.describe Event, type: :model do
  subject do
    described_class.new(points: '1', meeting_name: 'First Meeting', start_time: '2023-12-04 09:30:00', end_time: '2023-12-04 10:30:00')
  end

  it 'is valid with all valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without points' do
    subject.points = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without meeting name' do
    subject.meeting_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without meeting start time' do
    subject.start_time = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without meeting end time' do
    subject.end_time = nil
    expect(subject).not_to be_valid
  end

end

RSpec.describe User, type: :model do
    subject do
      described_class.new(first_name: 'Test', last_name: 'User', password: 'abcdef', email: 'abc@gmail.com')
    end
  
    it 'is valid with all valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without first name' do
        subject.first_name = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without last name' do
        subject.last_name = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without password' do
        subject.password = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without email' do
        subject.email = nil
        expect(subject).not_to be_valid
    end
end


