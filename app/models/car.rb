class Car

  def initialize(make,year, color)
    @make = make
    @year = year
    @speed = 0
    @lights = "off"
    @parking_brake = false
    @color = color
  end

  def get_make
    @make
  end

  def get_year
    @year
  end

  def get_speed
    @speed
  end

  def accelerate
    if @parking_brake == false
      @speed += 10
    end
  end

  def brake
    if @speed > 6
      @speed -= 7
    else
      @speed = 0
    end
  end

  def get_lights
    @lights
  end

  def toggle_lights
    if @lights == "off"
      @lights = "on"
    else
      @lights = "off"
    end
  end

  def parking_brake
    if @parking_brake == false && @speed == 0
      @parking_brake = true
    else
      @parking_brake = false
    end
  end

  def get_parking_brake
    @parking_brake
  end

  def get_color
    @color
  end

end
