class LinkRewriter < Nanoc::Filter
  identifier :rewrite_links

  def run(content, params = {})
    # Automatically turns href="path/file.md" or href="file.adoc" into href="path/file/"
    content.gsub(/href="([^"]+)\.(md|adoc)"/, 'href="\1.html"')
  end
end
