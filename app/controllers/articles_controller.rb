class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def index
		@article = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article].inspect
		# @article = Article.new(article_params)
		# @article.save
		# redirect_to article_path(@article)
		# debugger
		@article = Article.new(article_params)
		@article.user = User.first
		if @article.save
			flash[:success] = "Article succesfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def show
		# @article = Article.find(params[:id])   
	end

	def edit
		# @article= Article.find(params[:id])
	end

	def update
		# @article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:success] = "Article succesfully Updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def destroy
		# @article = Article.find(params[:id])
		@article.destroy
		flash[:danger] = "Article was successfully deleted"
		redirect_to articles_path
	end

	private

	def set_article
		@article= Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description)
	end

end