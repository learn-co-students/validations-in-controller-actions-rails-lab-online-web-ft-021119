class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.new(author_params)
      if @author.valid? #is the author valid?
        @author.save #if valid save the author to db
        redirect_to author_path(@author) #then redirect author to author page 
      else
        render :new #takes them back to the author form again to fill out info if the author is not valid
      end
  #  @author = Author.create!(author_params)

    #redirect_to author_path(@author)
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
