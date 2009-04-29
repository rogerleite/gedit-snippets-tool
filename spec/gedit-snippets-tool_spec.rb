require File.expand_path(File.dirname(__FILE__) + "/../lib/gedit_snippets_tool.rb")
include GeditSnippetsTool

describe GeditSnippetsTool do

    before do
        @commands = Commands.new
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

    it "should respond with help for invalid argument" do
        @commands.should_receive(:show_help)
        @commands.execute(['-Xnksnksn'])
    end

end

