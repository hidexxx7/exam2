class PicturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "写真を投稿しました！"
      NoticeMailer.sendmail_picture(@picture).deliver
    else
      render 'new'
    end

  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(pictures_params)
    redirect_to pictures_path, notice: "写真を更新しました！"
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: "写真を削除しました！"
  end

  private
    def pictures_params
      params.require(:picture).permit(:title, :content)
    end
end
