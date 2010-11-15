class ExercisesController < ApplicationController
  USERNAME = "projektab"
  PASSWORD = "c29cd86bb68a4c259f3b117b729eb2090d53bab2"
  
  # before_filter :authenticate
  
  def index
    @exercises = Exercise.all(:order => :position)
  end
  
  def show
    @exercise = Exercise.find(params[:id])
  end
  
  def preview
    @exercise = Exercise.find(params[:id])
    
    template = File.read("public/exercise_export_template.haml")
    haml_engine = Haml::Engine.new(template)
    output = haml_engine.render(scope=@exercise)
    
    render :text => output
  end
  
  def new
    @exercise = Exercise.new
    @type_sequence = Array.new
  end
  
  def create
    @exercise = Exercise.new(params[:exercise])
    if @exercise.save
      flash[:notice] = "Successfully created exercise."
      redirect_to @exercise
    else
      render :action => 'new'
    end
  end
  
  def duplicate
    @exercise = Exercise.find(params[:id])
    
    # using deep_cloning plugin
    @dup = @exercise.clone :include => [{:multiple_choices => :multiple_choice_options}, {:single_choices => :single_choice_options}, :marktexts, :clozes, {:dropdowns => {:dropdown_definitions => :dropdown_options}}] 
           
    if @dup.save
      flash[:notice] = "Successfully duplicated exercise."
      redirect_to :action => "edit", :id => @dup.id
    else
      flash[:error] = "Cannot duplicate exercise"
      redirect_to :action => "index"
    end
  end
  
  def edit
    @exercise = Exercise.find(params[:id])
    @type_sequence = @exercise.construct_sequence
  end
  
  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(params[:exercise])
      flash[:notice] = "Successfully updated exercise."
      redirect_to @exercise
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    flash[:notice] = "Successfully destroyed exercise."
    redirect_to exercises_url
  end
  
  def sort
     @exercise = Exercise.all
      @exercise.each do |exercise|
        exercise.position = params[:exercise].index(exercise.id.to_s) + 1
        exercise.save
      end

      render :nothing => true
    end
  
  private
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == USERNAME && Digest::SHA1.hexdigest(password) == PASSWORD
      end
    end
end
