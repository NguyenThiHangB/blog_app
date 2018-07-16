class EntriesController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :find_entry, only: [:show]
  before_action :correct_user, only: %i(edit update destroy)

  def index
    @entries = Entry.index_entry
                 .page(params[:page])
                 .per Settings.entry.per_page
  end

  def show

  end

  def new
    @entry = current_user.entries.build
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = t ".success"
      redirect_to @entry
    else
      render "static_pages/home"
    end
  end

  def edit; end

  def update
    if @entry.update_attributes entry_params
      flash[:success] = t ".success"
      redirect_to @entry
    else
      render :edit
    end
  end

  def destroy
    if @entry.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".danger"
    end
    redirect_to current_user
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :content)
  end

  def find_entry
    @entry = Entry.find_by id: params[:id]
    return if @entry
    flash.now[:danger] = t ".danger"
  end

  def correct_user
    @entry = current_user.entries.find_by id: params[:id]
    redirect_to root_url unless @entry
  end
end
