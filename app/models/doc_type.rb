class DocType < ActiveRecord::Base
	has_many :docs

	validates :name, presence: true
end