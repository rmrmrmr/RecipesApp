# spec/models/food_spec.rb
require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.create(name: 'food', measurement_unit: 'kg', price: 10, quantity: 1, user_id: 1) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should not be smaller than 1' do
    subject.quantity = 0
    expect(subject).to_not be_valid
  end

  it 'price should not be smaller than 1' do
    subject.price = 0
    expect(subject).to_not be_valid
  end
end
