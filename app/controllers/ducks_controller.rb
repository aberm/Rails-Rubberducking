class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new
    @students = Student.all
  end

  def create
    @students = Student.all
    @duck = Duck.create(strong_params(:name, :description, :student_id))
    redirect_to duck_path(@duck)
  end

  def edit
    @duck = Duck.find(params[:id])
    @students = Student.all
  end

  def update
    @duck = Duck.find(params[:id])
    @duck.update(strong_params(:name, :description, :student_id))
    @duck.save
    redirect_to duck_path(@duck)
  end

  def delete
  end

  def strong_params(*args)
    params.require(:duck).permit(*args)
  end

end
