class SandboxController < ApplicationController
    
    layout 'sandbox'
    
    def index
        list
        render('list')
    end
    
    def list
        @instances = Instance.order("created_at desc")
    end
    
    def service_start
        instance = Instance.find(params[:id])
        if params[:as]
            instance.service_start_as if not instance.as_running?
        else
            instance.service_start_cs if not instance.cs_running?
        end
        redirect_to(:action => 'index')
        
        # For AJAX
        #render :update do |page|
        #    page.replace_html :serviceComponentName, :partial => 'components_list', :object => @components
        #    page.replace :home_table, :partial => 'home_table', :object => @patches
        #end        
    end
    
    def service_stop
        instance = Instance.find(params[:id])
        if params[:as]
            instance.service_stop_as if instance.as_running?
        else
            instance.service_stop_cs if instance.cs_running?
        end
        redirect_to(:action => 'index')
    end
        
end
