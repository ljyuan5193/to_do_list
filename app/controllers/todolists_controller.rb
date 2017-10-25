class TodolistsController < ApplicationController
   before_action :set_todolists , :only => [:show, :edit, :update, :destroy]
  def index
    @todolists = Todolist.all
  end

  def new
  @todolists = Todolist.new
end

def create
  @todolists = Todolist.new(todolist_params)
 if   @todolists.save
  redirect_to todolists_url
else
  render  :action => :new
end
end

def show

end

def edit
end

def update
  if @todolists.update_attributes(todolist_params)
  redirect_to todolists_path(@todolists)
else
  render  :action => :edit
end
end

def destroy
now_date = Time.now.strftime("%Y").to_i*10000 + Time.now.strftime("%m").to_i*100 + Time.now.strftime("%d").to_i
event_time = @todolists.duedate.strftime("%Y").to_i*10000 + @todolists.duedate.strftime("%m").to_i*100 + @todolists.duedate.strftime("%d").to_i
if now_date <= event_time
@todolists.destroy
$errormsg = ""
else
$errormsg = @todolists.name + " 事件過期 無法刪除"
end
redirect_to todolists_url
end

private
def set_todolists
    @todolists  = Todolist.find(params[:id])
 end

def todolist_params
  params.require(:todolist).permit(:name, :duedate, :note)
end
  end
