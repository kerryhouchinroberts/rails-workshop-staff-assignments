class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params.require(:person).permit(:first_name, :last_name, :title))
      redirect_to person_path(@person), notice: "Person was updated!"
    else
      flash.now[:alert] = "Last name and Title or First Name must be present"
      render :edit
    end
  end

  def create
    @person = Person.new(params.require(:person).permit(:first_name, :last_name, :title))
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      flash.now[:alert] = "Last name and Title or First Name must be present"
      render :new
    end
  end

end
