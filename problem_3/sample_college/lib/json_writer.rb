module JsonWriter
  require 'json'
  
  def add_to_file file_path, ary_of_object
    File.open(file_path,"w") do |f|
      f.write(JSON.pretty_generate(ary_of_object))
    end
  end
end