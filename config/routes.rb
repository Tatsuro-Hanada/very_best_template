Rails.application.routes.draw do
  devise_for :members
  # Routes for the Member resource:

  # READ
  get("/members", { :controller => "members", :action => "index" })
  get("/members/:id_to_display", { :controller => "members", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
