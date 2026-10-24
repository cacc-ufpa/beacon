require 'asciidoctor'

class AsciiDocFilter < Nanoc::Filter
	identifier :asciidoctor

	def run(content, params = {})
		# Converts AsciiDoc content to an HTML fragment suitable for layouts
		Asciidoctor.convert(content, safe: :safe, header_footer: false)
	end
end

