require 'rails_helper'
RSpec.describe Users, type: :model do
  subject do
    Users.new(name: 'Mohammed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Engineer from Mexico.',
              posts_counter: 0)
  end
  it 'name should be present ' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'comments_counter should be not valid' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'comments_counter should be not valid' do
    subject.comments_counter = 0.2
    expect(subject).to_not be_valid
  end
  it 'likes_counter should be not valid' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
  it 'likes_counter should be not valid' do
    subject.likes_counter = 0.2
    expect(subject).to_not be_valid
  end
end
