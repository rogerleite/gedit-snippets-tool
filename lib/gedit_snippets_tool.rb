require File.expand_path(File.dirname(__FILE__) + "/snippet")
require 'erubis'

module GeditSnippetsTool

    VERSION = '0.2.1'

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

            hash_of_snippets = Snippet.all(snippet_name)

            input = File.read(File.expand_path(File.dirname(__FILE__) + "/../template/template.eruby"))
            eruby = Erubis::EscapedEruby.new(input)      # create Eruby object

            ## create context object
            ## (key means var name, which may be string or symbol.)
            context = {
              :hash_of_snippets  => hash_of_snippets
            }

            puts eruby.evaluate(context)         # get result
        end

    end

end

