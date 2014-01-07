class LaptopsController < ApplicationController
  def index
    @title = "Laptops"
    @laptop = Laptop.all
  end
  
  def new
    @laptop = Laptop.new
    @title = "New laptop"
  end
  
  def create
    @laptop = Laptop.new(laptop_params)
    if @laptop.save
      redirect_to laptops_path
    else
      render 'new'
    end
  end
  
  def edit
    @laptop = Laptop.find(params[:id])
    @title = "Editing #{@laptop.itemname}"
  end
  
  def update
    if @laptop.update_attributes(laptop_params)
      redirect_to @laptop
    else
      render 'edit'
    end
  end
  
  private
  
    def laptop_params
      params.require(:laptop).permit(:itemname, :scancode, :available)
    end
end
