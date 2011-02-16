class AdminController < ApplicationController
    
    layout 'admin'
    
    def index
        menu
        render('menu')
    end
    
    def menu
        
    end
    
end
