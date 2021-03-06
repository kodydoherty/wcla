class Doc < ActiveRecord::Base
	belongs_to :doc_type
	belongs_to :user

	validates :title, presence: true
	validates :url, presence: true
end