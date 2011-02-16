require 'win32/service'

# Add the following to applicaiton.rb to successfully require win32/service
#
#config.autoload_paths << "C:/Ruby187/lib/ruby/gems/1.8/gems/win32-api-1.4.8-x86-mingw32/bin"
#config.autoload_paths << "C:/Ruby187/lib/ruby/gems/1.8/gems/win32-api-1.4.8-x86-mingw32/lib"
#config.autoload_paths << "C:/Ruby187/lib/ruby/gems/1.8/gems/windows-api-0.4.0/bin"
#config.autoload_paths << "C:/Ruby187/lib/ruby/gems/1.8/gems/windows-api-0.4.0/lib"
#config.autoload_paths << "C:/Ruby187/lib/ruby/gems/1.8/gems/windows-pr-1.1.3/bin"
#config.autoload_paths << "C:/Ruby187/lib/ruby/gems/1.8/gems/windows-pr-1.1.3/lib"
#config.autoload_paths << "C:/Ruby187/lib/ruby/gems/1.8/gems/win32-service-0.7.1-x86-mswin32-60/bin"
#config.autoload_paths << "C:/Ruby187/lib/ruby/gems/1.8/gems/win32-service-0.7.1-x86-mswin32-60/lib"

class Instance < ActiveRecord::Base
    
    validates_uniqueness_of :host_name, :scope => :service_name
    
    validates_presence_of :host_name
    validates_presence_of :service_name
    validates_presence_of :cs_version
    validates_presence_of :rm_version
    
    validates_length_of :host_name, :maximum => 50
    validates_length_of :service_name, :maximum => 50
    validates_length_of :cs_version, :maximum => 10
    validates_length_of :rm_version, :maximum => 10    
    
    VERSION_REGEX = /^\d+(\.\d)*$/
    validates_format_of :cs_version, :with => VERSION_REGEX
    validates_format_of :rm_version, :with => VERSION_REGEX
    
    
    def service_start_cs
        Win32::Service.start(service_name, host_name)
    end
    
    def service_stop_cs
        Win32::Service.stop(service_name, host_name)
    end
    
    def service_status_cs
        status = Win32::Service.status(service_name, host_name)
        status.current_state
    end
    
    def service_start_as
        Win32::Service.start(service_name + 'Admin', host_name)
    end
    
    def service_stop_as
        Win32::Service.stop(service_name + 'Admin', host_name)
    end
    
    def service_status_as
        status = Win32::Service.status(service_name + 'Admin', host_name)
        status.current_state
    end

    def cs_running?
        status = Win32::Service.status(service_name, host_name)
        if status.current_state == 'running'
            return true
        else
            return false
        end
    end

    def as_running?
        status = Win32::Service.status(service_name + 'Admin', host_name)
        if status.current_state == 'running'
            return true
        else
            return false
        end
    end

    def cs_stopped?
        status = Win32::Service.status(service_name, host_name)
        if status.current_state == 'stopped'
            return true
        else
            return false
        end
    end

    def as_stopped?
        status = Win32::Service.status(service_name + 'Admin', host_name)
        if status.current_state == 'stopped'
            return true
        else
            return false
        end
    end

end
