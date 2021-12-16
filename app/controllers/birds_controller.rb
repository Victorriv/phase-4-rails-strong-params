require 'byebug'

class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    #bird = Bird.create(name: params[:name], species: params[:species]) # these are passed as a hash
    #bird = Bird.create(params.permit(:name, :species)) #permit lets you white list the params we want.\
      
    bird = Bird.create(bird_params)
    render json: bird, status: :created
    #key of name to come from params of name
  end
 #



  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private 

def bird_params
  params.permit(:name, :species)


end


end
=begin
Whenever we have a controller ex BirdController rails will generate
a nested params hash using the attributes it finds in our bird model.
as a nested params hash. 

if we dont want this wrapped parameters. 
  we do this 
     wrap_parameters format: []
     
=end 

=begin



=end 