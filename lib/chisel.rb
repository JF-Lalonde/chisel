class Chisel
  attr_reader :markdown_text

  def initialize(input_file)
    @markdown_text = File.readlines(input_file)
    #Add methods here
  end

  def header_to_html
    markdown_text.each do |line|
      if line.start_with?("#")
        pound = line.count "#"
        front = line.index(" ")
        header_text = line[(front + 1)..-2]
        @headers = "<h#{pound}>#{header_text}</h#{pound}>"
      end
    end
    @headers
  end

  def paragraph_to_html
    markdown_text.each do |line|
      if !line.start_with?("#") && line != "\n"
        @paragraphs = "<p>#{line.chomp}</p>"
      end
    end
    @paragraphs
  end

  def emphasis_to_html
    markdown_text.each do |line|
      if line.include?"*"
        @emphasis = line.gsub("*", "<em>")
      end
    end
    @emphasis
  end

  def strong_to_html
    markdown_text.each do |line|
      if line.include?"**"
        @strong = line.gsub("**", "<strong>")
      end
    end
    @strong
  end
end
