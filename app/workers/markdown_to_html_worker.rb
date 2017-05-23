class MarkdownToHtmlWorker
  include Sidekiq::Worker

  def perform(post)
    post = Post.find(post)

    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    html = markdown.render(post.texto_md)

    post.update_columns({texto_html: html, published_at: Time.now}) 
  end
end
