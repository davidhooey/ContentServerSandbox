class InstancesController < ApplicationController
    
    layout 'admin'
    
    def index
        list
        render('list')
    end
    
    def list
        @instances = Instance.order("created_at desc")
    end
    
    def show
        @instance = Instance.find(params[:id])
    end

    def new
        @instance = Instance.new
    end
    
    def create
        @instance = Instance.new(params[:instance]) 
        if @instance.save
            flash[:notice] = "Instance created successfully."
            redirect_to(:action => 'list')
        else
            render('new')
        end        
    end
    
    def edit
        @instance = Instance.find(params[:id])
    end
    
    def update
        @instance = Instance.find(params[:id])
        if @instance.update_attributes(params[:instance])
            flash[:notice] = "Instance updated successfully."
            redirect_to(:action => 'list')
        else
            render('edit')
        end                
    end
    
    def delete
        @instance = Instance.find(params[:id])
    end
    
    def destroy
        instance = Instance.find(params[:id])
        instance.destroy
        flash[:notice] = "Instance removed successfully."
        redirect_to(:action => 'list')        
    end
    
end
