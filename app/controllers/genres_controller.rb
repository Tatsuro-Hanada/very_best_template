class GenresController < ApplicationController
  def index
    @q = Genre.ransack(params[:q])
    @genres = @q.result(:distinct => true).includes(:events).page(params[:page]).per(10)

    render("genre_templates/index.html.erb")
  end

  def show
    @event = Event.new
    @genre = Genre.find(params.fetch("id_to_display"))

    render("genre_templates/show.html.erb")
  end

  def new_form
    @genre = Genre.new

    render("genre_templates/new_form.html.erb")
  end

  def create_row
    @genre = Genre.new

    @genre.name = params.fetch("name")

    if @genre.valid?
      @genre.save

      redirect_back(:fallback_location => "/genres", :notice => "Genre created successfully.")
    else
      render("genre_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @genre = Genre.find(params.fetch("prefill_with_id"))

    render("genre_templates/edit_form.html.erb")
  end

  def update_row
    @genre = Genre.find(params.fetch("id_to_modify"))

    @genre.name = params.fetch("name")

    if @genre.valid?
      @genre.save

      redirect_to("/genres/#{@genre.id}", :notice => "Genre updated successfully.")
    else
      render("genre_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @genre = Genre.find(params.fetch("id_to_remove"))

    @genre.destroy

    redirect_to("/genres", :notice => "Genre deleted successfully.")
  end
end
