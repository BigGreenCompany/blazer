require "redcarpet"

module Blazer::MessagesHelper

  def markdown
    renderer = Redcarpet::Render::HTML.new(
      # Specify the CSS classes to be applied to code blocks
      :with_toc_data => true,
      :hard_wrap => true,
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :highlight => true,
      :quote => true,
      :footnotes => true,
      :strikethrough => true,
      :underline => false,
      :highlight => true,
      :tables => true,
      :space_after_headers => true,
      :autolink => true,
      :disable_indented_code_blocks => true,
      :prettify => true,
      :superscript => true,
      :link_attributes => {rel: 'nofollow', target: "_blank"},
      # Specify the CSS classes to be applied to code blocks
      :code_attr => 'class="my-code-block-class"',
      :codespan_attr => 'class="my-code-span-class"'
    )

    Redcarpet::Markdown.new(renderer)
  end
end
