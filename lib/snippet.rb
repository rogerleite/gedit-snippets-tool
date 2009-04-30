require 'rexml/document'

class Snippet

  attr_accessor :tag, :description, :text, :accelerator

  def self.all(snippet_name=nil)
    snippet_name = '*' if snippet_name.nil?
    path_to_xmls = ENV['HOME'] + "/.gnome2/gedit/snippets/#{snippet_name}.xml"

    snippets = {}
    Dir.glob(path_to_xmls).each do |file|
      doc = REXML::Document.new( File.new(file) )
      file_name = File.basename(file, '.xml')
      snippets[file_name] = load_by_xml(doc)
    end

    snippets
  end

  def self.load_by_xml xml_snippet
    snippets = []
    xml_snippet.root.each_element('//snippet') do |snippet_element|
        snippets << parse(snippet_element)
    end
    snippets
  end

  private

  def self.parse(snippet_element)
    new_snippet = Snippet.new
    #puts snippet_element  #help to debug :(
    new_snippet.tag = snippet_element.elements['tag'].text unless snippet_element.elements['tag'].nil?
    new_snippet.description = snippet_element.elements['description'].text unless snippet_element.elements['description'].nil?

    text_element = snippet_element.elements['text']
    if not text_element.nil?
        new_snippet.text = text_element.cdatas.first
    end

    accelerator_element = snippet_element.elements['accelerator']
    if not accelerator_element.nil?
        new_snippet.accelerator = accelerator_element.cdatas.first
    end

    new_snippet
  end

end

