class MoviesController < ApplicationController


  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    if (params[:id] == nil)
      @movies = Movie.all
      @css_style_date = nil
      @css_style_title = nil
    elsif (params[:id] == 'title_sort')
      # @movies = Movie.find(:all , :order => "title")
      @movies = Movie.all.sort_by { |m| m.title }
      @css_style_title = "hilite"
      @css_style_date = nil
    elsif(params[:id] == 'release_date_sort')
      @movies = Movie.find(:all , :order => "release_date")
      @css_style_date = "hilite"
      @css_style_title = nil
    end
  end

  # def sort_title
  #   @movies = Movie.find(:all , order => "title")
  # end

  # def sort_date
  #   @movies = Movie.find(:all , order => "release_date")
  # end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
