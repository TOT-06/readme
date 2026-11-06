class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # 投稿一覧

  def index

    @articles = Article.order(created_at: :desc)

  end

  # 投稿詳細

  def show

  end

  # 新規投稿画面

  def new

    @article = Article.new

  end

  # 投稿を保存

  def create

    @article = Article.new(article_params)

    if @article.save

      redirect_to articles_path, notice: "投稿しました。"

    else

      render :new, status: :unprocessable_entity

    end

  end

  # 編集画面

  def edit

  end

  # 投稿を更新

  def update

    if @article.update(article_params)

      redirect_to articles_path, notice: "投稿を更新しました。"

    else

      render :edit, status: :unprocessable_entity

    end

  end

  # 投稿を削除

  def destroy

    @article.destroy

    redirect_to articles_path, alert: "投稿を削除しました。"

  end

  private

  def set_article

    @article = Article.find(params[:id])

  end

  def article_params

    params.require(:article).permit(:title, :content)

  end

end
 