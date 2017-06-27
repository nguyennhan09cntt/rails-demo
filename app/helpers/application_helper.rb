module ApplicationHelper
  def menu
    permissionData = UserPermission.where('fk_user= :fk_user', {:fk_user => @current_user.id})
    menuData = Hash.new
    if permissionData
      permissionData each do |data|
        if data.fk_user_component == ApplicationConstant::COMPONENT_CMS
          if data.resource_display == ApplicationConstant::DISPLAY
            moduleName = data.module_name
            unless menuData[moduleName]
              menuData[moduleName] = Hash.new
            end

            resourceName = data.resource_name;
            if !isset(menuData[moduleName][resourceName])
              menuData[moduleName][resourceName] = Hash.new
            end

            menuData[moduleName][resourceName]['#{data.resource_controller}/#{data.privilege_action}'] = Hash[
              CMSConstant::PREFIX_MENU_NAME => data.privilege_name,
              CMSConstant::PREFIX_MENU_URL => '#{data.resource_controller}/#{data.privilege_action}'
            ]
          end
        end
      end
    end
    #return $this->view->render('menu.phtml');
  end
end
