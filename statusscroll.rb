class Marquee
  
  attr_accessor :status, :buffer_size

  def initialize(status = "test", buffer_size = 20)
    @buffer_size = buffer_size 
    @status = status.split("")
  end

  def print(str)
    `purple-remote "setstatus?message=#{str}"`
  end

  def scroll
    loop do
      marquee = status[0, buffer_size]
      print(marquee.to_s)
      
      carry = status.shift
      status << carry
      sleep 0.1
    end
  end

end

m = Marquee.new("onetwothreefourfivesixseveneightnineten")
m.scroll
