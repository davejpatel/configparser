require_relative 'config_parser'

describe "ConfigParser"  do

  let(:config_file) { "#{File.expand_path(File.dirname(__FILE__))}/config_file.txt" }
  let(:config_parser) { ConfigParser.new }

  describe "#boolean_like" do
    it "should return true if string contains boolean type" do
      value = config_parser.send(:boolean_like, "true")
      expect(value).to be(true)

      value = config_parser.send(:boolean_like, "false")
      expect(value).to be(true)

      value = config_parser.send(:boolean_like, "on")
      expect(value).to be(true)

      value = config_parser.send(:boolean_like, "off")
      expect(value).to be(true)

      value = config_parser.send(:boolean_like, "yes")
      expect(value).to be(true)

      value = config_parser.send(:boolean_like, "no")
      expect(value).to be(true)
    end
  end

  describe "#make_boolean" do
    it "should convert a 'true' string to true" do
      value = config_parser.send(:make_boolean, "true")

      expect(value).to be(true)
    end

    it "should convert a 'false' string to false" do
      value = config_parser.send(:make_boolean, "false")

      expect(value).to be(false)
    end
  end

  describe "#numeric_like" do
    it "should return true if string is numeric" do
      value = config_parser.send(:numeric_like, "123")

      expect(value).to be(true)
    end

    it "should return false if string is non numeric" do
      value = config_parser.send(:numeric_like, "abc")

      expect(value).to be(false)
    end
  end

  describe "#make_numeric" do
    it "should convert an integer string to an integer" do
      value = config_parser.send(:make_numeric, "123")

      expect(value).to eq("123".to_i)
    end

    it "should convert a float string to a float" do
      value = config_parser.send(:make_numeric, "123.123")

      expect(value).to eq("123.123".to_f)
    end

  end

  describe ".format" do
    it "should ignore commented config lines" do
      config = config_parser.send(:format, config_file)

      expect(config_file).to_not include("#")
    end
  end
end
