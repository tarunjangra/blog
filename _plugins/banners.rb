module Tarun
  
   class BannerBlock < Liquid::Tag
    def initialize(tag, markup, tokens)
      super
      opts = markup.strip.split(/\s+/, 3)
      @src = opts[0].strip
      @width = opts[1].strip
    end

    def render(context)
      html = "<figure class='unprintable'><img src='#{Yegor::Img.new(@src, context)}'" \
        " style='width:#{@width}px;max-width:100%;'" \
        " alt='banner'/></figure>\n\n"
    end
  end

  
end

Liquid::Template.register_tag("banner", Tarun::BannerBlock)
