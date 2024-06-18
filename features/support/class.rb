$global_variable = 5
class TestVar
  @@class_variable = 10
  def initialize(x)
    @x = x
    @@class_variable += 1
   end

   def user
     @x
   end
end

ob = TestVar.new(5)
puts ob.user
