require 'rails_helper'
RSpec.describe Posts,type: :model do
    subject { Posts.new(user_id:1,author_id: 1, title: 'Hello', text: 'This is my first post') } 
    it "title should be present " do 
        subject.title = nil
        expect(subject).to_not be_valid
    end
    it "title should be not valid " do 
        subject.title = "hi"
        expect(subject).to_not be_valid
    end
    it "post_counter should be not valid" do
        subject.post_counter = -1
        expect(subject).to_not be_valid
    end
    it "post_counter should be not valid" do
        subject.post_counter = 0.2
        expect(subject).to_not be_valid
    end
end
