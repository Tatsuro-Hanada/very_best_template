class AttendancesController < ApplicationController
  before_action :current_member_must_be_attendance_member, :only => [:edit_form, :update_row, :destroy_row]

  def current_member_must_be_attendance_member
    attendance = Attendance.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_member == attendance.member
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @attendances = current_member.attendances.page(params[:page]).per(10)

    render("attendance_templates/index.html.erb")
  end

  def show
    @attendance = Attendance.find(params.fetch("id_to_display"))

    render("attendance_templates/show.html.erb")
  end

  def new_form
    @attendance = Attendance.new

    render("attendance_templates/new_form.html.erb")
  end

  def create_row
    @attendance = Attendance.new

    @attendance.member_id = params.fetch("member_id")
    @attendance.event_id = params.fetch("event_id")

    if @attendance.valid?
      @attendance.save

      redirect_back(:fallback_location => "/attendances", :notice => "Attendance created successfully.")
    else
      render("attendance_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_event
    @attendance = Attendance.new

    @attendance.member_id = params.fetch("member_id")
    @attendance.event_id = params.fetch("event_id")

    if @attendance.valid?
      @attendance.save

      redirect_to("/events/#{@attendance.event_id}", notice: "Attendance created successfully.")
    else
      render("attendance_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @attendance = Attendance.find(params.fetch("prefill_with_id"))

    render("attendance_templates/edit_form.html.erb")
  end

  def update_row
    @attendance = Attendance.find(params.fetch("id_to_modify"))

    
    @attendance.event_id = params.fetch("event_id")

    if @attendance.valid?
      @attendance.save

      redirect_to("/attendances/#{@attendance.id}", :notice => "Attendance updated successfully.")
    else
      render("attendance_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_member
    @attendance = Attendance.find(params.fetch("id_to_remove"))

    @attendance.destroy

    redirect_to("/members/#{@attendance.member_id}", notice: "Attendance deleted successfully.")
  end

  def destroy_row_from_event
    @attendance = Attendance.find(params.fetch("id_to_remove"))

    @attendance.destroy

    redirect_to("/events/#{@attendance.event_id}", notice: "Attendance deleted successfully.")
  end

  def destroy_row
    @attendance = Attendance.find(params.fetch("id_to_remove"))

    @attendance.destroy

    redirect_to("/attendances", :notice => "Attendance deleted successfully.")
  end
end
