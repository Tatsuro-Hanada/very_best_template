class InterestsController < ApplicationController
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

  def edit_form
    @interest = Interest.find(params.fetch("prefill_with_id"))

    render("interest_templates/edit_form.html.erb")
  end

  def update_row
    @interest = Interest.find(params.fetch("id_to_modify"))

    @interest.member_id = params.fetch("member_id")
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
