require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Book do
  
  before(:each) do
    @book = Book.new
  end
  
  def self.it_urlifies original, expected
    it "should transform #{original.inspect} into #{expected.inspect}" do
      @book.urlify(original).should == expected
    end
  end
  
  describe "urlify" do
    it_urlifies '',                      ''
    it_urlifies ' ',                     '-'
    it_urlifies 'funky chicken',         'funky-chicken'
    it_urlifies 'multi space example',   'multi-space-example'
    it_urlifies "what's a single quote", 'what-s-a-single-quote'
    it_urlifies 'question?',             'question-question-mark'
    it_urlifies 'exclamation!',          'exclamation-exclamation-mark'
    it_urlifies 'HELLO',                 'hello'
    it_urlifies 'It handles periods.',   'it-handles-periods-period'
    it_urlifies 'Even. In the middle.',  'even-period-in-the-middle-period'
    it_urlifies 'handle, funky, commas', 'handle-comma-funky-comma-commas'
  end
  
  describe "generate_url" do
    before(:each) do
      @book.should_receive(:urlify).any_number_of_times.and_return 'urlified-url'
    end
    it "should set a url" do
      @book.should_receive(:url=).once
      
      @book.generate_url
    end
    it "should use the title for the url" do
      @book.should_receive(:title).once
      
      @book.generate_url
    end
    it "should set the url whatever urlify returns" do
      @book.should_receive(:url=).once.with 'urlified-url'
      
      @book.generate_url
    end
  end
  
end