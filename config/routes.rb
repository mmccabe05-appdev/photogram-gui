Rails.application.routes.draw do
  get("/",{:controller=>"users",:action=>"index"})
  get("/users",{:controller=>"users",:action=>"index"})
  get("/users/:path_username",{:controller=>"users",:action=>"show"})
    
  get("/photos",{:controller=>"photos",:action=>"index"})
  get("/photos/:path_photo",{:controller=>"photos",:action=>"show"})

  get("/delete_photo/:path_photo",{:controller=>"photos",:action=>"delete"})
  get("/insert_photo_record/",{:controller=>"photos",:action=>"add"})
  get("/update_photo/:path_photo",{:controller=>"photos",:action=>"update"})
  get("/insert_comment_record",{:controller=>"photos",:action=>"new_comment"})

  get("/insert_user_record/",{:controller=>"users",:action=>"add"})
  get("/update_username/:path_user_id",{:controller=>"users",:action=>"update"})


end
