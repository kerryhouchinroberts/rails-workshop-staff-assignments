class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
    @person = Person.find(params[:person_id])
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @person = Person.find(params[:person_id])
    @assignment.person_id = @person.id
    if @assignment.save
      redirect_to person_path(@person)
    else
      flash.now[:alert] = "Please select a location and role."
      render :new
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @person = Person.find(params[:person_id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    @person = Person.find(params[:person_id])
    @assignment.person_id = @person.id
    if @assignment.update_attributes(assignment_params)
      redirect_to person_path(@person)
    else
      flash.now[:alert] = "Please select a location and role."
      render :new
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @person = Person.find(params[:person_id])
    if @assignment.destroy
      redirect_to person_path(@person), notice: 'Assignment was destroyed'
    end
  end


  private
  def assignment_params
    params.require(:assignment).permit(:location_id, :role)
  end
end
