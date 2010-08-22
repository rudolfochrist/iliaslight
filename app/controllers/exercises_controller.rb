class ExercisesController < ApplicationController
  
  
  def index
    @exercises = Exercise.all
  end
  
  def show
    @exercise = Exercise.find(params[:id])
  end
  
  def new
    @exercise = Exercise.new
    @type_order = set_type_order
  end
  
  def create
    @exercise = Exercise.new(params[:exercise])
    if @exercise.save
      flash[:notice] = "Successfully created exercise."
      @exercise.export_to_html
      redirect_to @exercise
    else
      @type_order = set_type_order
      render :action => 'new'
    end
  end
  
  def edit
    @exercise = Exercise.find(params[:id])
    @type_order = set_type_order
  end
  
  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(params[:exercise])
      @exercise.export_to_html
      flash[:notice] = "Successfully updated exercise."
      redirect_to @exercise
    else
      @type_order = set_type_order
      render :action => 'edit'
    end
  end
  
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy_export
    @exercise.destroy
    flash[:notice] = "Successfully destroyed exercise."
    redirect_to exercises_url
  end
  
  def set_type_order
    mcs = @exercise.multiple_choices.reverse
    scs = @exercise.single_choices.reverse
    marks = @exercise.marktexts.reverse
    cloz = @exercise.clozes.reverse
    drops = @exercise.dropdowns.reverse
    order = @exercise.type_sequence_positions
    type_order = Array.new
    order.each do |type|
      case type.type_name
      when "multiple_choices"
        obj = mcs.pop
        type_order << obj unless obj.nil?
      when "single_choices"
        obj = scs.pop
        type_order << obj unless obj.nil?
      when "marktexts"
        obj = marks.pop
        type_order << obj unless obj.nil?
      when "clozes"
        obj = cloz.pop
        type_order << obj unless obj.nil?
      when "dropdowns"
        obj = drops.pop
        type_order << obj unless obj.nil?
      end
    end
    type_order
  end
end
