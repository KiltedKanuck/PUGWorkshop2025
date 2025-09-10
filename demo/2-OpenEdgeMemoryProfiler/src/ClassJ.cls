block-level on error undo, throw.

class ClassJ:

    method void CreateWidgetPool ( input piCount as integer ):   
        if piCount eq 1 then
            create widget-pool "J1" persistent.
        
        if piCount eq 2 then
            create widget-pool "J2" persistent.
        
        message "In J" piCount.
    end method.

end class.