class ArgumentTypeError < StandardError
  
  def to_s
    "Incorrect argument given (Type Mismatch)"
  end
end
