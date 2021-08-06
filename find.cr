def main_global(args)
    arg = args.join(' ')
    ["/home/justinas/Documents/",
    "/home/justinas/Documents/**/",
    "/home/justinas/Downloads/",
    "/home/justinas/Downloads/**/",
    "/home/justinas/Coding Stuff/",
    "/home/justinas/Coding Stuff/**/",
    "/home/justinas/Pictures/",
    "/home/justinas/Pictures/**/",
    "/home/justinas/Music/",
    "/home/justinas/Music/**/",
    "/home/justinas/Videos/",
    "/home/justinas/Videos/**/",
    "/run/media/justinas/ManjaroHDD/Downloads/",
    "/run/media/justinas/ManjaroHDD/Downloads/**/",
    "/run/media/justinas/ManjaroHDD/Torrents/",
    "/run/media/justinas/ManjaroHDD/Torrents/**/"].each do |i|
        if check i + arg
            exit
        end
    end
    puts "Nothing Found"
end


def main_local(args)
    arg = args.join(' ')
    unless (check "" + arg) || (check "**/" + arg)
        puts "Nothing Found"
    end
end


def check(dir)
    globs = Dir.glob(dir, match_hidden: true)
    case globs.size
    when 0
        return false
    when 1
        puts "Opening " + globs[0]
        `xdg-open "#{globs[0]}"`
        return true
    else
        puts "Multiple matches found with " + dir
        globs.each do |i|
            puts i
        end
        return true
    end
end



# -l for a local search
begin
    if ARGV[0] == "-l"
        main_local ARGV[1..]
    else
        main_global ARGV
    end
rescue
    puts "No Arguments / Not Enough Arguments"
end
