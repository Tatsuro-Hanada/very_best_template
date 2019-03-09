class EventsController < ApplicationController
  def index
    @events = Event.all

    render("event_templates/index.html.erb")
  end

  def show
    @review = Review.new
    @attendance = Attendance.new
    @interest = Interest.new
    @event = Event.find(params.fetch("id_to_display"))

    render("event_templates/show.html.erb")
  end

  def new_form
    @event = Event.new

    render("event_templates/new_form.html.erb")
  end

  def create_row
    @event = Event.new

    @event.name = params.fetch("name")
    @event.date = params.fetch("date")
    @event.venue = params.fetch("venue")
    @event.description = params.fetch("description")
    @event.member_id = params.fetch("member_id")
    @event.genre_id = params.fetch("genre_id")

    if @event.valid?
      @event.save

      redirect_back(:fallback_location => "/events", :notice => "Event created successfully.")
    else
      render("event_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_genre
    @event = Event.new

    @event.name = params.fetch("name")
    @event.date = params.fetch("date")
    @event.venue = params.fetch("venue")
    @event.description = params.fetch("description")
    @event.member_id = params.fetch("member_id")
    @event.genre_id = params.fetch("genre_id")

    if @event.valid?
      @event.save

      redirect_to("/genres/#{@event.genre_id}", notice: "Event created successfully.")
    else
      render("event_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @event = Event.find(params.fetch("prefill_with_id"))

    render("event_templates/edit_form.html.erb")
  end

  def update_row
    @event = Event.find(params.fetch("id_to_modify"))

    @event.name = params.fetch("name")
    @event.date = params.fetch("date")
    @event.venue = params.fetch("venue")
    @event.description = params.fetch("description")
    
    @event.genre_id = params.fetch("genre_id")

    if @event.valid?
      @event.save

      redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
    else
      render("event_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @event = Event.find(params.fetch("id_to_remove"))

    @event.destroy

    redirect_to("/members/#{@event.member_id}", notice: "Event deleted successfully.")
  end

  def destroy_row_from_genre
    @event = Event.find(params.fetch("id_to_remove"))

    @event.destroy

    redirect_to("/genres/#{@event.genre_id}", notice: "Event deleted successfully.")
  end

  def destroy_row
    @event = Event.find(params.fetch("id_to_remove"))

    @event.destroy

    redirect_to("/events", :notice => "Event deleted successfully.")
  end
end
