require "redcarpet"

module Blazer::MessagesHelper

  def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
