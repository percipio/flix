class GenresController < ApplicationController
    before_action :set_genre, except: [:index, :new, :create]

    def index
        @genres = Genre.all.order("name asc")
    end

    def show
        @movies = @genre.movies.order("title desc")
    end

    def new
        @genre = Genre.new
    end

    def edit
    end

    def update
        if @genre.update(genre_params)
            redirect_to genres_path, notice: "Updated successfully"
        else
            render :edit, notice: "Something didn't work"
        end
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to genres_path, notice: "#{@genre.name} added"
        else
            render :new
        end
    end

    def destroy
        @genre.destroy
        redirect_to genres_path, notice: "You deleted the #{@genre.name} genre"
    end

private

    def genre_params
        params.require(:genre).permit(:name)
    end

    def set_genre
        @genre = Genre.find(params[:id])
    end
end
