class LaptopsController < ApplicationController
  def index
    @title = "Laptops"
    @laptop = Laptop.all
  end
end
