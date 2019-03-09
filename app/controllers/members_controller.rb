class MembersController < ApplicationController
  def index
    @members = Member.page(params[:page]).per(10)

    render("member_templates/index.html.erb")
  end

  def show
    @member = Member.find(params.fetch("id_to_display"))

    render("member_templates/show.html.erb")
  end
end
