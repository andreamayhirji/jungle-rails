require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    category = Category.create(name: "Anything")
    subject { Product.new(name:"Anything", description:"Lore ipsum", image:"Anything.jpeg", price_cents: "Anything".to_i, quantity: "Anything".to_i, category: category) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do 
      subject.name = nil
      expect(subject).to_not be_valid
    end
    
    it 'it is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it 'it is not valid without a quanitity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'it is not valid without a category' do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end

  end

end
