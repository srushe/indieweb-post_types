module ExampleData
  def example_data_for(filename)
    file = File.join(File.dirname(__FILE__), '../examples', filename)
    JSON.parse(File.read(file))
  end
end
