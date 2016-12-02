class  ArticlesController < ApplicationController

    before_action :set_artcile, only: [:edit, :update, :show, :destroy]

    #list ArticlesController
    def index
        @articles=Article.all
    end
    # new action
    def new
        @article= Article.new
    end

    def edit
       
        
    end


# create action

    def create
        debugger
        #render plain: params[:article].to_json
        @article= Article.new(article_params)
        @article.user= User.first
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update

        if @article.update(article_params)
            flash[:success] = "Article was succesfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

# show action

    def show
       
    end

    def destroy
        @article.destroy
        flash[:danger] = "Article was succesfully deleted"
        redirect_to articles_path
    end

# params
    private

    def set_artcile
        @article= Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end