require File.expand_path(File.dirname(__FILE__) + "/../lib/snippet")
require 'rexml/document'

describe Snippet do

  it "should parse valid xml with two snippet elements" do

    mock_xml = <<EOXML
<snippets language="rubyonrails">
  <snippet id="forin">
    <text><![CDATA[for ${1:element} in ${2:collection}
	${1:element}.$0
end
]]></text>
    <description>for .. in .. end</description>
    <tag>forin</tag>
  </snippet>
  <snippet>
    <text><![CDATA[default_scope :${1:name}, :conditions => { :${2:field} => ${3:condition} }, :order => "${4:field}"$0]]></text>
    <tag>ds</tag>
    <description>default_scope</description>
  </snippet>
</snippets>
EOXML

    mock_xml = REXML::Document.new(mock_xml)
    snippets = Snippet.load_by_xml(mock_xml)
    snippets.size.should == 2

    snippets.first.tag.should == 'forin'
    snippets.first.description.should == 'for .. in .. end'
    snippets.first.text.should == <<EOF
for ${1:element} in ${2:collection}
	${1:element}.$0
end
EOF

    snippets.last.tag.should == 'ds'
    snippets.last.description.should == 'default_scope'
    snippets.last.text.should == 'default_scope :${1:name}, :conditions => { :${2:field} => ${3:condition} }, :order => "${4:field}"$0'

  end

end

