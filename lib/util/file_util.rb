class FileUtil
  def self.file_to_int_array(file_name)
    File.open(file_name).readlines.map do |line|
      line.strip.to_i
    end
  end
end
