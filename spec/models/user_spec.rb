# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before { @user = User.new(name: "Andrzej", email: "man@wp.pl", password: "alleluja", password_confirmation: "alleluja") }

  subject { @user }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password_digest }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should be_valid }

  describe "when name is not present" do 
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do 
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when password is blank" do 
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when passwords don't match" do 
    before { @user.password = "asdad" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a"*51 } 
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = @user.password_confirmation = "a"*5 } 
    it { should_not be_valid }
  end

  describe "when password is " do
    before { @user.save }
    let (:found_user) { User.find_by_email(@user.email) }

    describe "when pass is valid" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "when pass is invalid" do
      let (:invalid_user) { found_user.authenticate("invalid pass") }

      it { should_not == invalid_user }
      specify { invalid_user.should be_false }
    end
  end

  describe "when email address is not valid" do
    it "should not be valid" do
      addresses = %w[asd ad@@add asd@sd+d.pl #@xtr]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email address is valid" do
    it "should be valid" do
      addresses = %w[jan@ham.pl one-three@gmail.com.pl A_der@gmail.xe.xe.pl]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email is duplicated" do
    before { 
      user2 = @user.dup
      user2.email = user2.email.upcase
      user2.save
    }

    it { should_not be_valid }
  end

  describe "email should be saved with downcase" do
    before { @user.email = "EfeE@wp.pD" }
    let (:emailBefore) { @user.email }

    it "should be saved with downcase" do 
      @user.save
      @user.reload.email.should == emailBefore.downcase
    end
  end
end
