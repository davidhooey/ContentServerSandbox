module ApplicationHelper
    
    def service_status_tag(instance, as, options={})
        options[:true]              ||= ''
        options[:true_class]        ||= 'status true'
        options[:false]             ||= ''
        options[:false_class]       ||= 'status false'
        options[:processing]        ||= ''
        options[:processing_class]  ||= 'status processing'
        
        if as
            options[:id] = instance.service_name + 'Admin_'  + instance.id.to_s
            options[:title] = instance.service_status_as.capitalize
            if instance.service_status_as == 'running'
                link_to(content_tag(:span, options[:true], :title => options[:title], :id => options[:id], :class => options[:true_class]), {:action => "service_stop", :id => instance.id, :as => as})
            elsif instance.service_status_as == 'stopped'
                link_to(content_tag(:span, options[:false], :title => options[:title], :id => options[:id], :class => options[:false_class]), {:action => "service_start", :id => instance.id, :as => as})
            else
                link_to(content_tag(:span, options[:processing], :title => options[:title], :id => options[:id], :class => options[:processing_class]), {:action => "index"})
            end
        else
            options[:id] = instance.service_name + '_' + instance.id.to_s
            options[:title] = instance.service_status_cs.capitalize
            if instance.service_status_cs == 'running'
                link_to(content_tag(:span, options[:true], :title => options[:title], :id => options[:id], :class => options[:true_class]), {:action => "service_stop", :id => instance.id, :as => as})
            elsif instance.service_status_cs == 'stopped'
                link_to(content_tag(:span, options[:false], :title => options[:title], :id => options[:id], :class => options[:false_class]), {:action => "service_start", :id => instance.id, :as => as})
            else
                link_to(content_tag(:span, options[:processing], :title => options[:title], :id => options[:id], :class => options[:processing_class]), {:action => "index"})
            end            
        end
    end
    
end
