require 'rails_helper'

describe Comment do
  describe 'association' do
    let(:comment) { create(:comment) }
    it 'should be associated with a prototype' do
      expect(comment.prototype).to be_present
    end
    
    it 'should be associated with a user' do
      expect(comment.user).to be_present
    end
  end
end
