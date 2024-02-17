# Process images of the form ![alt text](url) in preformatted Scheme code.
# Set preimg to true in a page's yaml prologue to enable.

module Jekyll
  module ProcessImageInPreFilter
    def process_image_in_pre(input)
      preimg = process_liquid "{{ page.preimg }}" 
      if preimg == 'true' then
        result = input.gsub(/<span class="n[fv]">!.*$/) {|s| piipf(s)}
      else
        input
      end
    end

    def piipf(str)
      # Drop the HTML tags
      newstr = str.gsub(/<[^>]*>/, "")
      # STDERR.puts("{{{ #{newstr} }}}\n");
      result = newstr.gsub(/!\[([^\]]*)\]\(([^)]*)\)/,
                           "<img src='\\2' alt='\\1'/>")
      # STDERR.puts("=> {{{ #{result} }}}\n");
      if (result == newstr)
        str
      else
        result
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ProcessImageInPreFilter)
