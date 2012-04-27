module QuestionsHelper
  def markdown string
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    string = string.gsub(/</, "&lt;")
    string = string.gsub(/>/, "&gt;")
    raw markdown.render string
  end

  def qua_mark string
    string.gsub!(/</, "&lt;")
    string.gsub!(/>/, "&gt;")
    regexp = /^```(\w+)/
    m = string.match regexp
    if m
      pre_match = m.pre_match # gets stuff before code
      lang = $1 # gets language
      post_match = m.post_match
      end_exp = /^```/
      m2 = post_match.match(end_exp)
      code = m2.pre_match # this is the code fragment
      after_code = m2.post_match # gets stuff after code
      str = ""
      str += (markdown(pre_match) if pre_match)
      str += ("<pre><code class=\"#{lang.empty? ? 'code': lang}\">" + code +"</code></pre>"  if code)
      str += qua_mark(after_code) if after_code
      str
    else
      markdown string
    end
  end
end
