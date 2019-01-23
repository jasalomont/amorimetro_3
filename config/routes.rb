Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "amorimetros#index"
  # Routes for the Amorimetro resource:

  # CREATE
  get("/amorimetros/new", { :controller => "amorimetros", :action => "new_form" })
  post("/create_amorimetro", { :controller => "amorimetros", :action => "create_row" })

  # READ
  get("/amorimetros", { :controller => "amorimetros", :action => "index" })
  get("/amorimetros/:id_to_display", { :controller => "amorimetros", :action => "show" })

  # UPDATE
  get("/amorimetros/:prefill_with_id/edit", { :controller => "amorimetros", :action => "edit_form" })
  post("/update_amorimetro/:id_to_modify", { :controller => "amorimetros", :action => "update_row" })

  # DELETE
  get("/delete_amorimetro/:id_to_remove", { :controller => "amorimetros", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
