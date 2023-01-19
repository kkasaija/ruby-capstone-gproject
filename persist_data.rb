require 'json'

class PersistData
  attr_reader :path_name

  def initialize(path_name)
    @path_name = path_name
  end

  def save(data)
    data_to_save = JSON.pretty_generate(data)
    File.write(path_name, data_to_save.to_s)
  end

  def load
    return [] unless File.exist?(@path_name)
    file = File.read(@path_name)
    JSON.parse(file)
  end
end