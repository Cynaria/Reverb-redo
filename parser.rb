class Parser
	def self.split_file(file)
		file = File.new(file, "r")
		text = file.read
		split_lines = text.split(/\n/)
		split_lines
	end

	def self.parse_info(info_str)
		info_str.split(/, |\|| /).delete_if {|s| s.empty?}
	end
end
