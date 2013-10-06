<?php
class User_Acl_Acl extends Zend_Acl
{
		public $user;
        public function __construct($auth = null)
        {
            $guest = new User_Acl_Role_Guest();
            $mod   = new User_Acl_Role_Mod();
            $admin = new User_Acl_Role_Admin();
            $temp = new User_Acl_Role_User();
            $defaultRole = $temp->getDefaultRole();
            $userRole = new User_Acl_Role_User();

            $this->addRole('guest');
            $this->addRole('user', 'guest'); //TODO: return this from db query through User_Acl_Role_User()
            $this->addRole($mod, $mod->_inheritsFrom);
            $this->addRole($admin, $admin->_inheritsFrom);
            // Create the Dirextion role
            $this->addRole('dxadmin', $admin);
            // These must be strings to reduce the number of includes when loading the acl for CkFinder

            $this->addResource(new Zend_Acl_Resource('login')); //<- Allows the hiding of the login navigation tab
            $this->addResource(new Zend_Acl_Resource('logout')); //<- Allows the hiding of the logout navigation tab
            $this->addResource(new Zend_Acl_Resource('admin:area')); //<- legacy support

            /*
             * resoruce schema
             * namespace {resources}.{modulename}.{controllername}.{action}
             *
             * privileges
             * base privelege {view.own}
             * view.own, view.all
             * create
             * edit.own, edit.all
             * delete.own, delete.all
             *
             * global admin privilege
             */
            $this->addResource(new Zend_Acl_Resource('resources.admin.index.index'));
            $this->addResource(new Zend_Acl_Resource('resources.admin.preowned'));
            $this->addResource(new Zend_Acl_Resource('resources.admin.contact'));
            $this->addResource(new Zend_Acl_Resource('resources.admin.menu'));

            $this->addResource(new Zend_Acl_Resource('news'));
            $this->addResource(new Zend_Acl_Resource('content'));
            $this->addResource(new Zend_Acl_Resource('page'));
            $this->addResource(new Zend_Acl_Resource('register'));
            $this->addResource(new Zend_Acl_Resource('user'));
            $this->addResource(new Zend_Acl_Resource('usermodule'));
            $this->addResource(new Zend_Acl_Resource('useraccount'));
            $this->addResource(new Zend_Acl_Resource('guestbook'));
            $this->addResource(new Zend_Acl_Resource('products'));
            $this->addResource(new Zend_Acl_Resource('media.files'));
            $this->addResource(new Zend_Acl_Resource('media.albums', 'media.files'));
            $this->addResource(new Zend_Acl_Resource('media', 'media.albums'));
            $this->addResource(new Zend_Acl_Resource('dxadmin-tools'));
            //$this->deny();

            $this->addResource(new Zend_Acl_Resource('testimonials'));
            // $this->deny();



            $this->allow($guest, array('page'), array('page.guest.view'));
            $this->allow($guest, array('user', 'page', 'testimonials'), array('user.login', 'user.register', 'page.view.comment', 'page.view.image', 'page.view.icon', 'testimonials.view.all'));
            $this->allow('user', array('user', 'useraccount', 'page'), array('user.view', 'user.logout',
            																  'user.account-editown', 'user.edit-account', //<-end user privs
            																  ));


            $this->allow('user', array('page'), array('page.user.view', 'page.view.comment', 'page.edit.comment.own', 'page.post.comment', 'page.view.file'));
            $this->allow('user', array('testimonials'), array('testimonials.post.new', 'testimonials.edit.own'));
            $this->allow('mod', array('page'), array('page.mod.view', 'page.view.admin.menu', 'page.edit.comment',
            										  'page.edit.file', 'page.edit.icon', 'page.edit.image', 'page.edit.content',
            										  'testimonials.edit.all'));

            $this->allow('mod', array('media.files', 'media.albums'), array('media.manage'));

            $this->allow('admin', array('media', 'media.albums', 'media.files'), array('admin.media', 'admin.media.delete'));
            $this->allow('admin', array('page'), array('page.manage', 'page.admin.view'));
            $this->allow('admin', array('user','useraccount'), array('admin:view', 'admin:submit', 'admin:edit', 'admin:delete', 'admin:summary', 'user.admin-create-user', 'user.admin-edit-user', 'admin.edit.user'));
            $this->allow('admin', array('admin:area', 'news', 'page'), array('admin.base', 'admin:view', 'admin:submit', 'admin:edit', 'admin:delete', 'admin:summary', 'admin-general-settings', 'manage-all'));

            $this->allow('admin', array('products'), array('resources.products.manage'));
            $this->allow('admin', array('testimonials'), array('testimonials.manage'));

            // admin access to admin index
            $this->allow('admin', array('resources.admin.index.index'), array('admin.manage.all'));
            $this->allow('admin', array('resources.admin.preowned'), array('admin.manage.preowned'));
            $this->allow('admin', array('resources.admin.contact'), array('admin.manage.contact'));
            $this->allow('admin', array('resources.admin.menu'), array('admin.manage.menu'));


            $this->allow('dxadmin', array('dxadmin-tools', 'testimonials'), array('dxadmin.manage.all'));
            $this->allow('dxadmin');
            //$this->deny('admin', array('dxadmin-summary'));
            $this->deny('user', array('user'), array('user.login', 'user.register'));
            /**
             * The below prevents logged users from seeing the login/register tabs
             */
            //$this->deny(new System_Acl_Role_User(), null, array('guest:login', 'guest:register'));
        }
        protected function addRoles()
        {
        	$rModel = new User_Model_AclRoles();
        	$roles = $rModel->getRoles();
        	//Zend_Debug::dump($rModel->getRoles());
        	$roles = array_reverse($roles);
        	foreach($roles as $role)
        	{
        		if($role['inheritsFrom'] == 'none')
        		{
        			$this->addRole($role['role']);
        			continue;
        		}
        		if($role['inheritsFrom'] !== 'none')
        		{
        			$this->addRole($role['role'], $role['inheritsFrom']);
        			continue;
        		}
        	}
        }
        protected function addResources()
        {
        	$resources = $this->pModel->getModules();
        	$values = array_unique($resources);
        	foreach($values as $resource)
        	{
        		$this->addResource(new Zend_Acl_Resource($resource['module']));
        	}
        }
        protected function addPrivileges()
        {
        	$dataArray = $this->pModel->getPrivileges();
        	foreach($dataArray as $data) :

				$this->allow ( $data['role'], $data['module'], ($data['specialPrivilege'] !== 'none') ? $data['specialPrivilege'] : $data['action'] );

		    endforeach;

        }
}