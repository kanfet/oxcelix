module Oxcelix
# The Comments class is a parser which builds an array of comments
  class Comments < ::Ox::Sax
    attr_accessor :commarray, :comment
    def initialize
      @commarray=[]
      @comment={}
    end
    
    # Push Cell comment hash (comment + reference) to @commarray
    def text(str)
      @comment[:comment]=str.gsub('&#10;', '')
      @commarray << @comment
      @comment = Hash.new
    end
    
    # Returns reference
    def attr(name, str)
      if name == :ref
        @comment[:ref]=str
      end
    end
  end
end
