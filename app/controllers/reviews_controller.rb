class ReviewsController < ApplicationController
  before_action :current_member_must_be_review_member, :only => [:edit_form, :update_row, :destroy_row]

  def current_member_must_be_review_member
    review = Review.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_member == review.member
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(:distinct => true).includes(:member, :event).page(params[:page]).per(10)

    render("review_templates/index.html.erb")
  end

  def show
    @review = Review.find(params.fetch("id_to_display"))

    render("review_templates/show.html.erb")
  end

  def new_form
    @review = Review.new

    render("review_templates/new_form.html.erb")
  end

  def create_row
    @review = Review.new

    @review.body = params.fetch("body")
    @review.member_id = params.fetch("member_id")
    @review.event_id = params.fetch("event_id")
    @review.rating = params.fetch("rating")

    if @review.valid?
      @review.save

      redirect_back(:fallback_location => "/reviews", :notice => "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_event
    @review = Review.new

    @review.body = params.fetch("body")
    @review.member_id = params.fetch("member_id")
    @review.event_id = params.fetch("event_id")
    @review.rating = params.fetch("rating")

    if @review.valid?
      @review.save

      redirect_to("/events/#{@review.event_id}", notice: "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @review = Review.find(params.fetch("prefill_with_id"))

    render("review_templates/edit_form.html.erb")
  end

  def update_row
    @review = Review.find(params.fetch("id_to_modify"))

    @review.body = params.fetch("body")
    
    @review.event_id = params.fetch("event_id")
    @review.rating = params.fetch("rating")

    if @review.valid?
      @review.save

      redirect_to("/reviews/#{@review.id}", :notice => "Review updated successfully.")
    else
      render("review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_member
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/members/#{@review.member_id}", notice: "Review deleted successfully.")
  end

  def destroy_row_from_event
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/events/#{@review.event_id}", notice: "Review deleted successfully.")
  end

  def destroy_row
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/reviews", :notice => "Review deleted successfully.")
  end
end
