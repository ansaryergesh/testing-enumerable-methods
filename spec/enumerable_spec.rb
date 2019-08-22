require './lib/enumerable_methods.rb'

RSpec.describe Enumerable do
  let(:arr){ [1,2,3,4] }
  let(:str) { ["ab","abc","abcdta"] }
  let(:str1) { ["ab","abc","abcdta", "a"] }
  let(:str2) { ["Ariel","Martin","Darwin","Michaleaaa","Art"] }
  let(:str3) { ["Ariel","Martin","Darwin","Art"] }
  let(:result){ [] }
  
  describe "#my_each" do
    it "it goes through of all element in the array" do

      expect(arr.my_each { |n| n}).to eql([1,2,3,4])
    end

    it "returns enumerator of the receiver" do

      expect(arr.my_each {|i| i }).to eql(arr.my_each {|i| i })
    end
  end

  describe "#my_each_with_index" do
    it "return elements in array with index" do

    arr.my_each_with_index { |item, index|
      result << item; result << index
    }
    expect(result).to eql([1,0,2,1,3,2,4,3])
    end
  end

  describe "#my_select"  do
    it "returns true if an item is even else false" do

    arr.my_select do |item|
      result << item.even?
    end
    
    expect(result).to eql([false, true, false, true])
    end

    it "returns an item which is greater than 2" do

      result=arr.my_select { |item| item > 2}
      expect(result).to eq(arr.my_select { |item| item > 2})
    end
  end

  describe "#my_all?" do
    it "returns true if each of words length is more than 2" do
      
      result = str.my_all? { |x| x.length >= 2 }
    expect(result).to be true
    end

    it "returns false if one of the words length is not more than 2" do

      result = str1.my_all? { |x| x.length >= 2}
    expect(result).to be false
    end
  end

  describe "#my_any?" do
    it "returns true if any words length is more than 9" do
      
      result = str2.my_any? {|a| a.length >= 9}
    expect(result).to be true
    end

    it "returns false if any words length is not more than 9" do
      
      result = str3.my_any? {|a| a.length >= 9}
    expect(result).to be false
    end
   end

  describe "my_none?" do
    it "returns true if none of the words length is more than 7" do
      
      result = str.my_none? { |x| x.length >= 7 }
    expect(result).to be true
    end 
   

    it "returns false if any of the words length is more than 2" do
    
      result = str.my_none? { |x| x.length >= 2 }
    expect(result).to be false
    end 
  end
   
  describe "my_count" do
    it "counts number of words in array( it should be 3 words)" do
      
      result = str.my_count {|x|}
    expect(result).to eql(str.my_count {|x|})
    end
  end

  describe "#my_map" do
    it "add 1 for each item" do
      
      expect(arr.my_map{ |i| i + 1 }).to eql(arr.my_map{ |i| i + 1 })
    end

    it "multiplies each item by 2" do
      
      expect(arr.my_map{ |i| i * 2 }).to eql(arr.my_map{ |i| i * 2 })
    end
  end

  describe "#my_inject" do 
    it "it gives addition of all element in the array " do
     
      result = arr.my_inject {|a, b| a + b}
      expect(result).to eql(arr.my_inject {|a, b| a + b})
    end

    it "it returns multiplication of all elements in the array" do
      
      result = arr.my_inject {|a, b| a * b}
      expect(result).to eql(arr.my_inject {|a, b| a * b})
    end
   end
end
