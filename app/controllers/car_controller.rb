class CarController < ApplicationController
  def create
    make = params[:make]
    year = params[:year]
    color = params[:color]
    @car = Car.new(make,year, color)
    session[:car] = @car.to_yaml
  end

  def accelerate
    @car = YAML.load(session[:car])
    @car.accelerate
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def brake
    @car = YAML.load(session[:car])
    @car.brake
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def toggle_lights
    @car = YAML.load(session[:car])
    @car.toggle_lights
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def parking_brake
    @car = YAML.load(session[:car])
    @car.parking_brake
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

end
