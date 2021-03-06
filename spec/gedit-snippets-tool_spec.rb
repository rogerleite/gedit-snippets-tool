require File.expand_path(File.dirname(__FILE__) + "/../lib/gedit_snippets_tool")
#include GeditSnippetsTool

describe GeditSnippetsTool do

    before do
        @commands = GeditSnippetsTool::Commands.new
    end

    it "should have a version" do
        VERSION.should_not be_nil
    end

    it "should respond for -cs argument" do
        @commands.should_receive(:generate_cheat_sheet)
        @commands.execute(['-cs'])
    end

    it "should respond for --cheat-sheet argument" do
        @commands.should_receive(:generate_cheat_sheet)
        @commands.execute(['--cheat-sheet'])
    end

    it "should respond for -cs argument with specific snippet name" do
        @commands.should_receive(:generate_cheat_sheet).with('ruby*')
        @commands.execute( %w(-cs ruby*) )
    end

    it "should respond with help for invalid argument" do
        @commands.should_receive(:show_help)
        @commands.execute(['-Xnksnksn'])
    end

end

