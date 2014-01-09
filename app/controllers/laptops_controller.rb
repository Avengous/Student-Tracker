class LaptopsController < ApplicationController
  def index
    @title = "Laptops"
    @laptop = Laptop.all
  end
  
  def show
    @laptop = Laptop.find(params[:id])
    @transaction = Transaction.where(:laptop_id => @laptop.id)
    
    @title = "History"
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
    @laptop = Laptop.find_by_id(params[:id])
    if @laptop.update_attributes(laptop_params)
      redirect_to laptops_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Laptop.find(params[:id]).destroy
    redirect_to laptops_url
  end
  
  def add_multiple_laptops
    @title = "Add Laptops"
    @entries = params[:entries]
    multicreate
  end
  
  def multicreate
    if @entries.nil? then
    else
      @entries.each_line do |entry|
        entry = entry.split(" ")    
        @laptop = Laptop.new(itemname: entry[0], scancode: entry[1])
        @laptop.save
      end
      redirect_to laptops_url
    end
  end
  
  private
  
    def laptop_params
      params.require(:laptop).permit(:itemname, :scancode, :available)
    end
end
