require 'spec_helper'

describe Recipe do

  before do
    # This code is wrong!
    @recipe = Recipe.new(title: "yummy recipe", category: "meat", ingredients: "yummy stuff", method: "cook", chef: "dan")
  end

  subject { @recipe }

  it { should respond_to(:title) }
  it { should respond_to(:category) }
  it { should respond_to(:ingredients) }
  it { should respond_to(:method) }
  it { should respond_to(:chef) }
end

