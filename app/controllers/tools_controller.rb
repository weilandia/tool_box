class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find_by(params[:user_id])
    @tools = @user.tools.all
  end

  def show
    @user = User.find(params[:user_id])

  end

  def new
    @user = User.find(params[:user_id])
    @tool = @user.tools.new
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @tool = @user.tools.find_or_initialize_by(tool_params)
    if !@tool.new_record?
      session[:most_recent_tool_id] = @tool.id
      flash[:update] = 'Tool was updated.'
      redirect_to user_path(@user.id)
    elsif @tool.save
      session[:most_recent_tool_id] = @tool.id
      flash[:notice] = 'Tool was created.'
      redirect_to user_path(@user.id)
    else
      flash[:alert] = 'Tool was not created.'
      render :new
    end
  end

  def update
    respond_to do |format|
      if @tool.update(tool_params)
        flash[:notice] = 'Tool was successfully updated.'
        redirect_to @tool
      else
        flash[:alert] = 'Tool was not updated.'
        render :edit
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @tool.destroy
    flash[:alert] = 'Tool was destroyed.'
    redirect_to user_path(@user.id)
  end

  private
    def set_tool
      user = User.find(params[:user_id])
      @tool = user.tools.find(params[:id])
    end

    def tool_params
      params.require(:tool).permit(:name, :price, :quantity, :user_id)
    end
end
