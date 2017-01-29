require 'rails_helper'

RSpec.describe User, type: :model do
  before  { @user = User.new(name: 'Paul', email:'user@example.com', password: '123456', telephone: '+79780000000') }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:telephone) }
  it { should respond_to(:password) }
  it { should be_valid }

  it { should has_many(:orders) }

  describe "when email is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid}
  end

  describe "user has many orders" do

  end
end
