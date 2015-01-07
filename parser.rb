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

	def self.combine_files(*files)
		File.open('./data/combined.txt', "w") do |f|
			files.each do |file|
				split = Parser.split_file(file)
				split.each do |info_str|
					info = Parser.parse_info(info_str)
					f << " #{info[0]} #{info[1]} #{info[2]} #{info[3]} #{info[4]} \n"
				end
				
			end
		end
	end


end
