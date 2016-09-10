require './argument_type_error'
module Collection
  
  def self.make_flat(array)
    raise ArgumentTypeError unless array.instance_of? Array
    array.join('__').split('__').map(&:to_i).sort
  end
  
end