# Process images of the form ![alt text](url) in preformatted Scheme code.
# Set linkprocs to true in a page's yaml prologue to enable.

module Jekyll
  module LinkProcsFilter

    @@reference = "https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/Reference/procs"

    @@linkable = [
      "above",
      "all-of",
      "and",
      "any-of",
      "beside-align",
      "beside",
      "car",
      "cdr",
      "circle?",
      "compound-image?",
      "cond",
      "cons",
      "crop",
      "curve",
      "hshift",
      "outlined-circle",
      "outlined-ellipse",
      "outlined-equilateral-triangle",
      "outlined-polygon",
      "outlined-rectangle",
      "outlined-square",
      "overlay",
      "overlay/origin",
      "rotate",
      "solid-circle",
      "solid-ellipse",
      "solid-equilateral-triangle",
      "solid-polygon",
      "solid-rectangle",
      "solid-square",
      "solid-wedge",
      "vshift",
    ]

    def link_procs(input)
      linkprocs = process_liquid "{{ page.linkprocs }}" 
      if linkprocs == 'true' then
        # Jekyll.logger.debug "LINKING PROCEDURES"
        result = input.gsub(/(<span class="nf">)([^<]*)(<\/span>)/) {|s| lp(s, $1, $2, $3)}
      else
        # Jekyll.logger.debug "SKIPPING LINKS"
        input
      end
    end

    def lp(str, pre, procedure, post)
      if @@linkable.include?(procedure) then
        # STDERR.puts("LINKING #{procedure}") 
        result = "<a href='#{@@reference}/#{procedure}.html'>#{str}</a>"
      else
        str
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LinkProcsFilter)
