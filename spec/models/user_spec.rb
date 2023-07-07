# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:foods).class_name('Food').with_foreign_key('user_id') }
    it { should have_many(:recipes).dependent(:destroy).with_foreign_key('user_id') }
  end

  describe 'devise modules' do
    it { should be_validatable }
    it { should be_database_authenticatable }
    it { should be_recoverable }
    it { should be_rememberable }
  end
end
