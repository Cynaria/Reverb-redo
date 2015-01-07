class Parser
	def self.split_file(file)
		file = File.new(file, "r")
		text = file.read
		split_lines = text.split(/\n/)
		split_lines
	end
end
