require "fileutils"


module FileCleaner
    DELETE_LIST_REGEX = %r(\w*~$ ^\\#.* ^a\\.exe.* ^a\\.out$ .*\\.class$)
        
    def remove(f)
    
        result = Dir.glob("*\0*/**").select do |s|
            s.match(/#{DELETE_LIST_REGEX}/) 
        end

        FileUtils.rm result

        # word -> abc|def|Ghi


        DELETE_LIST_REGEX.each do |word|
          if /#{word}/ =~ File.basename(f)
            FileUtils.rm f unless File.directory
          end
        end        
    end

    def remove_files_recursively(files)
        files.each do |file|
            Dir.glob("#{file}/**/*") do |f|
                deleteFile(f) unless File.directory?(f)
            end
        end
  end

  def remove_file
    Dir.glob("*") do |f|
      deleteFile(f) unless File.directory?(f)
    end
  end
end

