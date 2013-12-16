class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness => true, length: {minimum: 10}
	validates_length_of :description, within: 1..100, :message => "Must be at least 1 character or at most 100."
  validates :image_url, :allow_blank => true,  :format => {
			:with => %r{.(gif|jpg|png|GIF|JPG|PNG|GiF)},
      :message => 'must be a url for gif, jpg, or png.'
	}
end
