class BookmarksController < ApplicationController
  def new
    set_list
    @bookmark = Bookmark.new # Needed to instantiate the form_with
  end

  def create
    set_list
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
      if @bookmark.save
      # No need for app/views/restaurants/create.html.erb
      redirect_to list_path(@list)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
