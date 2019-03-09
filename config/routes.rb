Rails.application.routes.draw do
  # Routes for the Interest resource:

  # CREATE
  get("/interests/new", { :controller => "interests", :action => "new_form" })
  post("/create_interest", { :controller => "interests", :action => "create_row" })

  # READ
  get("/interests", { :controller => "interests", :action => "index" })
  get("/interests/:id_to_display", { :controller => "interests", :action => "show" })

  # UPDATE
  get("/interests/:prefill_with_id/edit", { :controller => "interests", :action => "edit_form" })
  post("/update_interest/:id_to_modify", { :controller => "interests", :action => "update_row" })

  # DELETE
  get("/delete_interest/:id_to_remove", { :controller => "interests", :action => "destroy_row" })

  #------------------------------

  # Routes for the Event resource:

  # CREATE
  get("/events/new", { :controller => "events", :action => "new_form" })
  post("/create_event", { :controller => "events", :action => "create_row" })

  # READ
  get("/events", { :controller => "events", :action => "index" })
  get("/events/:id_to_display", { :controller => "events", :action => "show" })

  # UPDATE
  get("/events/:prefill_with_id/edit", { :controller => "events", :action => "edit_form" })
  post("/update_event/:id_to_modify", { :controller => "events", :action => "update_row" })

  # DELETE
  get("/delete_event/:id_to_remove", { :controller => "events", :action => "destroy_row" })

  #------------------------------

  devise_for :members
  # Routes for the Member resource:

  # READ
  get("/members", { :controller => "members", :action => "index" })
  get("/members/:id_to_display", { :controller => "members", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
