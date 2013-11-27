module ApplicationHelper
	def display_datetime(dt)
		dt.strftime("%m/%d/%Y %l:%M%P %Z")
	end
	def pdf_path(file)
  		File.join('/files', file).to_s
	end
end
