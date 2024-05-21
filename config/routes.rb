Rails.application.routes.draw do
  # Routes for the Fact finding resource:

  # CREATE
  post("/insert_fact_finding", { :controller => "fact_findings", :action => "create" })
          
  # READ
  get("/fact_findings", { :controller => "fact_findings", :action => "index" })
  
  get("/fact_findings/:path_id", { :controller => "fact_findings", :action => "show" })
  
  # UPDATE
  
  post("/modify_fact_finding/:path_id", { :controller => "fact_findings", :action => "update" })
  
  # DELETE
  get("/delete_fact_finding/:path_id", { :controller => "fact_findings", :action => "destroy" })

  #------------------------------

  # Routes for the Message resource:

  # CREATE
  post("/insert_message", { :controller => "messages", :action => "create" })
          
  # READ
  get("/messages", { :controller => "messages", :action => "index" })
  
  get("/messages/:path_id", { :controller => "messages", :action => "show" })
  get("/famessages/:path_id/:emp_id", { :controller => "fas", :action => "msgshow" })
  get("/famessages", { :controller => "fas", :action => "msgindex" })
  
  # UPDATE
  
  post("/modify_message/:path_id", { :controller => "messages", :action => "update" })
  
  # DELETE
  get("/delete_message/:path_id", { :controller => "messages", :action => "destroy" })

  #------------------------------

  # Routes for the Note resource:
  get("/", { :controller => "employees", :action => "index" })

  get("/admin", { :controller => "admins", :action => "admin" })
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
  # Routes for the Fact finding resource:

  # CREATE
  post("/insert_fact_finding", { :controller => "fact_findings", :action => "create" })
          
  # READ
  get("/fact_findings", { :controller => "fact_findings", :action => "index" })
  
  get("/fact_findings/:path_id", { :controller => "fact_findings", :action => "show" })
  
  # UPDATE
  
  post("/modify_fact_finding/:path_id", { :controller => "fact_findings", :action => "update" })
  
  # DELETE
  get("/delete_fact_finding/:path_id", { :controller => "fact_findings", :action => "destroy" })

  #------------------------------

  # Routes for the Message resource:

  # CREATE
  post("/insert_message", { :controller => "messages", :action => "create" })
          
  # READ
  get("/messages", { :controller => "messages", :action => "index" })
  
  get("/messages/:path_id", { :controller => "messages", :action => "show" })
  
  # UPDATE
  
  post("/modify_message/:path_id", { :controller => "messages", :action => "update" })
  
  # DELETE
  get("/delete_message/:path_id", { :controller => "messages", :action => "destroy" })

  #------------------------------

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
#FAs

  #------------------------------
  get("/fa.:path_id", { :controller => "fas", :action => "index" })
  get("/fa", { :controller => "fas", :action => "unauth" })
  get("/fadisciplines/:path_id/:emp_id", { :controller => "fas", :action => "dshow" })

  get("/famessages/:path_id/:emp_id", { :controller => "fas", :action => "msgshow" })

  post("/read_message/:path_id", { :controller => "fas", :action => "read_message" })

  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Define a custom route for FA

  
  # Define other routes
  resources :employees, only: [:index, :show] # Adjust actions as needed
  resources :disciplines, only: [:index, :show] # Adjust actions as needed
  
  root to: 'home#index'

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
    end
  end
