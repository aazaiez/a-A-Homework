require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Tucker") }
  let(:brownie) { Dessert.new("cookie",100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    let(:ice_cream) {Desert.new("ice","a",chef)}
    it "raises an argument error when given a non-integer quantity" do
      expect{ice_cream.quantity}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("chocolate")
      expect(brownie.ingredients).to eq(["chocolate"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate","caramel","fudge","honey","sugar"]
      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end
      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      expect(brownie.ingredients).not_to eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
    brownie.eat(50)
    expect(brownie.quantity).to eq(50)
    end



    it "raises an error if the amount is greater than the quantity" do
        expect{brownie.eat(200)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef.name).to eq("Tucker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end

end
