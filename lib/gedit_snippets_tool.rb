require File.expand_path(File.dirname(__FILE__) + "/snippet")
#require 'snippet'

module GeditSnippetsTool

    VERSION = '0.2.0'

    class Commands

        def execute(args)
            command = args.shift.strip rescue '--help'

            if %w(-h --help).include? command
                show_help
            elsif %w(-v --version).include? command
                puts "#{File.basename($0)} #{VERSION}"
            elsif %w(-cs --cheat-sheet).include? command
                generate_cheat_sheet args[0]
            else
                puts "Unknow command '#{command}'"
                puts ""
                show_help
            end
        end

        def show_help
            puts "Usage: #{File.basename($0)} [OPTION]"
            puts "Tool to generate cheat sheet of gedit's snippets"
            puts ""
            puts "Valid options:"
            puts "-cs, --cheat-sheet\tcreate cheat sheet of yours gedit's snippets"
            puts "-h, --help\tshow this help"
            puts "-v, --version\tshow #{File.basename($0)}'s version"
            puts ""
        end

        def generate_cheat_sheet(snippet_name=nil)
            #puts "generate_cheat_sheet"
            hash_of_snippets = Snippet.all(snippet_name)
            puts hash_of_snippets
        end

    end

end

