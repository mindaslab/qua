module QuestionsHelper
  def markdown string
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    string = string.gsub /</, "&lt;"
    string = string.gsub />/, "&gt;"
    raw markdown.render string
  end
end
