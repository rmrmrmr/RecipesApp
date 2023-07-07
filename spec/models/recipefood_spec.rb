# spec/models/shoppinglist_spec.rb
require 'rails_helper'

RSpec.describe Recipefood, type: :model do
  subject { Recipefood.new(quantity: 10, foods_id: 1, recipes_id: 1) }

  before { subject.save }

  it 'quantity should not be smaller than 1' do
    subject.quantity = 0
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be an integer' do
    subject.quantity = 1.5
    expect(subject).to_not be_valid
  end

  it 'recipe reference should be present' do
    subject.recipes_id = nil
    expect(subject).to_not be_valid
  end

  it 'food reference should be present' do
    subject.foods_id = nil
    expect(subject).to_not be_valid
  end
end
