class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
   
    @list_of_photos = matching_photos.order({:created_at => :desc})

    render({ :template => "photo_templates/index.html.erb" })
  end


  def show
    url_photo = params.fetch("path_photo")
    matching_photo = Photo.where({:id=>url_photo})
    @the_photo = matching_photo.first
    
    render({ :template => "photo_templates/show.html.erb" })
  end

  def delete
    url_photo = params.fetch("path_photo")
    matching_photo = Photo.where({:id=>url_photo})
    @the_photo = matching_photo.first
    @the_photo.destroy

    # render({ :template => "photo_templates/deleted.html.erb" })
    redirect_to("/photos")
  end
  def add
    url_photo = params.fetch("input_image")
    n = Photo.new
    n.image = url_photo
    n.caption = params.fetch("input_caption")
    n.owner_id = params.fetch("input_owner_id")
    n.save
    new_photo_id = n.id

    matching_photo = Photo.where({:id=>new_photo_id})
    @the_photo = matching_photo.first

    # render({ :template => "photo_templates/show.html.erb" })
    redirect_to("/photos/" + new_photo_id.to_s)
  end 
end
