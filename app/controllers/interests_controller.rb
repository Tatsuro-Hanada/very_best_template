class InterestsController < ApplicationController
  before_action :current_member_must_be_interest_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_member_must_be_interest_user
    interest = Interest.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_member == interest.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @interests = Interest.all

    render("interest_templates/index.html.erb")
  end

  def show
    @interest = Interest.find(params.fetch("id_to_display"))

    render("interest_templates/show.html.erb")
  end

  def new_form
    @interest = Interest.new

    render("interest_templates/new_form.html.erb")
  end

  def create_row
    @interest = Interest.new

    @interest.member_id = params.fetch("member_id")
    @interest.event_id = params.fetch("event_id")

    if @interest.valid?
      @interest.save

      redirect_back(:fallback_location => "/interests", :notice => "Interest created successfully.")
    else
      render("interest_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_event
    @interest = Interest.new

    @interest.member_id = params.fetch("member_id")
    @interest.event_id = params.fetch("event_id")

    if @interest.valid?
      @interest.save

      redirect_to("/events/#{@interest.event_id}", notice: "Interest created successfully.")
    else
      render("interest_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @interest = Interest.find(params.fetch("prefill_with_id"))

    render("interest_templates/edit_form.html.erb")
  end

  def update_row
    @interest = Interest.find(params.fetch("id_to_modify"))

    
    @interest.event_id = params.fetch("event_id")

    if @interest.valid?
      @interest.save

      redirect_to("/interests/#{@interest.id}", :notice => "Interest updated successfully.")
    else
      render("interest_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @interest = Interest.find(params.fetch("id_to_remove"))

    @interest.destroy

    redirect_to("/members/#{@interest.member_id}", notice: "Interest deleted successfully.")
  end

  def destroy_row_from_event
    @interest = Interest.find(params.fetch("id_to_remove"))

    @interest.destroy

    redirect_to("/events/#{@interest.event_id}", notice: "Interest deleted successfully.")
  end

  def destroy_row
    @interest = Interest.find(params.fetch("id_to_remove"))

    @interest.destroy

    redirect_to("/interests", :notice => "Interest deleted successfully.")
  end
end
