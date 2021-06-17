require 'asciidoctor'
require 'asciidoctor/extensions'

class YouTubeBlockMacro < Asciidoctor::Extensions::BlockMacroProcessor
  use_dsl
  
  named :youtube

  def process parent, target, attrs
    html = %(<div style="position: relative; padding-bottom: 56.25%;">
  <iframe src="https://www.youtube.com/embed/#{target}" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="border-width: 0; position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
</div>)

    create_pass_block parent, html, attrs, subs: nil
  end
end

Asciidoctor::Extensions.register do
  block_macro YouTubeBlockMacro if document.basebackend? 'html'
end
