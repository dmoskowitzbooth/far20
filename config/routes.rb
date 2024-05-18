Rails.application.routes.draw do
  # Routes for the Note resource:

  # CREATE
  post("/insert_note", { :controller => "notes", :action => "create" })
          
  # READ
  get("/notes", { :controller => "notes", :action => "index" })
  
  get("/notes/:path_id", { :controller => "notes", :action => "show" })
  
  # UPDATE
  
  post("/modify_note/:path_id", { :controller => "notes", :action => "update" })
  
  # DELETE
  get("/delete_note/:path_id", { :controller => "notes", :action => "destroy" })

  #------------------------------

  # Routes for the Discipline resource:

  # CREATE
  post("/insert_discipline", { :controller => "disciplines", :action => "create" })
          
  # READ
  get("/disciplines", { :controller => "disciplines", :action => "index" })
  
  get("/disciplines/:path_id", { :controller => "disciplines", :action => "show" })
  
  # UPDATE
  
  post("/modify_discipline/:path_id", { :controller => "disciplines", :action => "update" })
  
  # DELETE
  get("/delete_discipline/:path_id", { :controller => "disciplines", :action => "destroy" })

  #------------------------------

  # Routes for the Employee resource:

  # CREATE
  post("/insert_employee", { :controller => "employees", :action => "create" })
          
  # READ
  get("/employees", { :controller => "employees", :action => "index" })
  
  get("/employees/:path_id", { :controller => "employees", :action => "show" })
  
  # UPDATE
  
  post("/modify_employee/:path_id", { :controller => "employees", :action => "update" })
  
  # DELETE
  get("/delete_employee/:path_id", { :controller => "employees", :action => "destroy" })

  #------------------------------
    Rails.application.routes.draw do
  # Routes for the Note resource:

  # CREATE
  post("/insert_note", { :controller => "notes", :action => "create" })
          
  # READ
  get("/notes", { :controller => "notes", :action => "index" })
  
  get("/notes/:path_id", { :controller => "notes", :action => "show" })
  
  # UPDATE
  
  post("/modify_note/:path_id", { :controller => "notes", :action => "update" })
  
  # DELETE
  get("/delete_note/:path_id", { :controller => "notes", :action => "destroy" })

  #------------------------------

  # Routes for the Discipline resource:

  # CREATE
  post("/insert_discipline", { :controller => "disciplines", :action => "create" })
          
  # READ
  get("/disciplines", { :controller => "disciplines", :action => "index" })
  
  get("/disciplines/:path_id", { :controller => "disciplines", :action => "show" })
  
  # UPDATE
  
  post("/modify_discipline/:path_id", { :controller => "disciplines", :action => "update" })
  
  # DELETE
  get("/delete_discipline/:path_id", { :controller => "disciplines", :action => "destroy" })

  #------------------------------

      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    end

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  root to: "home#index"
  
end