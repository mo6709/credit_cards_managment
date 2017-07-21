class Category < ActiveRecord::Base
	has_many :cards

	validates :title, :presance => true
end
