require "redcarpet"

module MessagesHelper

  def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
