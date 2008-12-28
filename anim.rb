#!/usr/bin/env ruby -w -rubygems

require 'RMagick'
include Magick

class AnimatedGif
  def initialize(xsize, ysize, delay, enddelay)
    @anim = ImageList.new
    @xsize = xsize
    @ysize = ysize
    @delay = delay
    @enddelay = enddelay
  end
  
  private
  def draw_frame(img, func)
    draw = Draw.new
    func.call(draw)
    draw.draw(img)
    @anim << img.copy
  end
  
  public
  def draw_new_frame(&func)
    draw_frame(Image.new(@xsize, @ysize), func)
  end
  
  def draw_last_frame(&func)
    begin
      img = @anim.cur_image
    rescue IndexError
      img = Image.new(@xsize, @ysize)
    end
    draw_frame(img, func)
  end
  
  def write(filename)
    @anim.delay = @delay
    @anim.cur_image.delay = @enddelay
    # infinite loop
    @anim.iterations = 0
    @anim.write(filename)
  end
end

class Draw
  def circle_radius_color (x, y, r, color)
    stroke(color)
    circle(x, y, x, y + r)
  end
end

anim = AnimatedGif.new(100, 100, 100, 300)
5.times do |i|
  anim.draw_new_frame do |draw|
    draw.fill('transparent')
    draw.circle_radius_color(25, 25, 15 + i, 'red')
    draw.circle_radius_color(25, 75, 20 - i, 'blue')
    draw.circle_radius_color(75, 25, 20 - i, 'green')
    draw.circle_radius_color(75, 75, 15 + i, 'orange')
  end
end
anim.write('test.gif')
