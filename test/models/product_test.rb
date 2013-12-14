require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
	fixtures :products
  #   assert true
  # end
	test "product attribs must not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
	end
	test "price must be positive" do
		product = Product.new(title:"My test book",description:"test description",image_url:'test.jpg',price:-1)
		assert product.invalid?
		assert_equal 'must be greater than or equal to 0.01', product.errors[:price].join('; ')
		product.price = 0
		assert product.invalid?
		assert_equal 'must be greater than or equal to 0.01', product.errors[:price].join('; ')
		product.price = 1
		assert product.valid?
	end
	def new_product(img_url)
		Product.new(title: 'My test book',
		  	        description: 'my desc.',
		            price: 1,
		            image_url: img_url
			)
	end

	test 'img url' do
		ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.PNG FReD.GiF http://a.b.c/z/y/x/fred.gif}
		bad = %w{fred.doc frd.mov}
		ok.each do |name|
			assert new_product(name).valid?, "#{name} shouldn't be invalid"
		end
		bad.each do |name|
			assert new_product(name).invalid?, "#{name} shouldnt be valid"
		end
	end
	test 'product is not valid without unique title' do
		product = Product.new(title: products(:ruby).title,
													description: 'yyy',
													price: 1,
													image_url: 'fred.gif')
		assert !product.save
		assert_equal "has already been taken", product.errors[:title].join('; ')
	end
end
