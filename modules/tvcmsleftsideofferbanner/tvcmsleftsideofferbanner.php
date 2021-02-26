<?php
/**
* 2007-2020 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2020 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

include_once('classes/tvcmsleftsideofferbanner_image_upload.class.php');

class TvcmsLeftSideOfferBanner extends Module
{
    protected $config_form = false;

    public function __construct()
    {
        $this->name = 'tvcmsleftsideofferbanner';
        $this->tab = 'front_office_features';
        $this->version = '2.1.9';
        $this->author = 'ThemeVolty';
        $this->need_instance = 0;

        
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('ThemeVolty - Left Side Offer Banner');
        $this->description = $this->l('This is Show Left Side Offer Banner in Front Side');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
        $this->module_key = '';

        $this->confirmUninstall = $this->l('Warning: all the data saved in your database will be deleted.'.
            ' Are you sure you want uninstall this module?');
    }

    public function install()
    {
        $this->defineVariable();

        $this->installTab();

        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('backOfficeHeader') &&
            $this->registerHook('displayLeftColumn');
    }

    public function defineVariable()
    {
        $result = array();
        $languages = Language::getLanguages();

        foreach ($languages as $lang) {
            $result['TVCMSLEFTSIDEOFFERBANNER_CAPTION'][$lang['id_lang']] = 'This is Caption';
        }

        Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME', 'demo_img_1.jpg');
        Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR', 'demo_img_1_ar.jpg');
        Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_CAPTION', $result['TVCMSLEFTSIDEOFFERBANNER_CAPTION']);
        
        // Default option is :- "left", "center", "right", "none".
        Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_CAPTION_SIDE', 'none');
        Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_LINK', '#');
        Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL', 0);
    }

    public function installTab()
    {
        $response = true;

        // First check for parent tab
        $parentTabID = Tab::getIdFromClassName('AdminThemeVolty');

        if ($parentTabID) {
            $parentTab = new Tab($parentTabID);
        } else {
            $parentTab = new Tab();
            $parentTab->active = 1;
            $parentTab->name = array();
            $parentTab->class_name = "AdminThemeVolty";
            foreach (Language::getLanguages() as $lang) {
                $parentTab->name[$lang['id_lang']] = "ThemeVolty Extension";
            }
            $parentTab->id_parent = 0;
            $parentTab->module = $this->name;
            $response &= $parentTab->add();
        }
        
        // Check for parent tab2
        $parentTab_2ID = Tab::getIdFromClassName('AdminThemeVoltyModules');
        if ($parentTab_2ID) {
            $parentTab_2 = new Tab($parentTab_2ID);
        } else {
            $parentTab_2 = new Tab();
            $parentTab_2->active = 1;
            $parentTab_2->name = array();
            $parentTab_2->class_name = "AdminThemeVoltyModules";
            foreach (Language::getLanguages() as $lang) {
                $parentTab_2->name[$lang['id_lang']] = "ThemeVolty Configure";
            }
            $parentTab_2->id_parent = $parentTab->id;
            $parentTab_2->module = $this->name;
            $response &= $parentTab_2->add();
        }
        // Created tab
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = 'Admin'.$this->name;
        $tab->name = array();
        foreach (Language::getLanguages() as $lang) {
            $tab->name[$lang['id_lang']] = "Left Side Offer Banner";
        }
        $tab->id_parent = $parentTab_2->id;
        $tab->module = $this->name;
        $response &= $tab->add();

        return $response;
    }

    public function uninstall()
    {
        Configuration::deleteByName('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME');
        Configuration::deleteByName('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR');
        Configuration::deleteByName('TVCMSLEFTSIDEOFFERBANNER_CAPTION');
        Configuration::deleteByName('TVCMSLEFTSIDEOFFERBANNER_CAPTION_SIDE');
        Configuration::deleteByName('TVCMSLEFTSIDEOFFERBANNER_LINK');
        Configuration::deleteByName('TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL');

        $this->uninstallTab();

        return parent::uninstall();
    }

    public function uninstallTab()
    {
        $id_tab = Tab::getIdFromClassName('Admin'.$this->name);
        $tab = new Tab($id_tab);
        $tab->delete();
        return true;
    }

    public function getContent()
    {
        $messages = '';
        $tmp = array();
        $result = array();
        if (((bool)Tools::isSubmit('submittvcmsleftsideofferbanner')) == true) {
            $obj_image = new TvcmsLeftSideOfferBannerImageUpload();
            $languages = Language::getLanguages(false);

            if ($_FILES['TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME']) {
                $old_img = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME');
                $ans = $obj_image->imageUploading($_FILES['TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME'], $old_img);
                if ($ans['success']) {
                    $file_name = $ans['name'];
                    Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME', $file_name);
                } else {
                    $old_img = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME');
                    Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME', $old_img);
                }
            }

            if ($_FILES['TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR']) {
                $old_img = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR');
                $ans = $obj_image->imageUploading($_FILES['TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR'], $old_img);
                if ($ans['success']) {
                    $file_name = $ans['name'];
                    Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR', $file_name);
                } else {
                    $old_img = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR');
                    Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR', $old_img);
                }
            }

            foreach ($languages as $lang) {
                $tmp = Tools::getValue('TVCMSLEFTSIDEOFFERBANNER_CAPTION_'.$lang['id_lang']);
                $result['TVCMSLEFTSIDEOFFERBANNER_CAPTION'][$lang['id_lang']] = $tmp;
            }

            $tmp = $result['TVCMSLEFTSIDEOFFERBANNER_CAPTION'];
            Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_CAPTION', $tmp);

            $tmp = Tools::getValue('TVCMSLEFTSIDEOFFERBANNER_CAPTION_SIDE');
            Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_CAPTION_SIDE', $tmp);

            $tmp = Tools::getValue('TVCMSLEFTSIDEOFFERBANNER_LINK');
            Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_LINK', $tmp);

            $tmp = Tools::getValue('TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL');
            Configuration::updateValue('TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL', $tmp);
            
            $this->clearCustomSmartyCache('tvcmsleftsideofferbanner_display_home.tpl');

            $messages .= $this->displayConfirmation($this->l("Offer Banner Information is Updated"));
        }

        $output =   $messages.
                    $this->renderForm();

        return $output;
    }

    public function clearCustomSmartyCache($cache_id)
    {
        if (Cache::isStored($cache_id)) {
            Cache::clean($cache_id);
        }
    }

    
    protected function renderForm()
    {
        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submittvcmsleftsideofferbanner';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFormValues(), /* Add values for your inputs */
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );

        return $helper->generateForm(array($this->getConfigForm()));
    }

    
    protected function getConfigForm()
    {
        return array(
            'form' => array(
                'legend' => array(
                'title' => $this->l('Left Side Offer Banner Settings'),
                'icon' => 'icon-cogs',
                ),
                'input' => array(
                    array(
                        'col' => 6,
                        'name' => 'TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME',
                        'type' => 'file_upload',
                        'label' => $this->l('Image'),
                    ),
                    array(
                        'col' => 6,
                        'name' => 'TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR',
                        'type' => 'file_upload',
                        'label' => $this->l('Image AR'),
                    ),
                    array(
                        'col' => 6,
                        'name' => 'TVCMSLEFTSIDEOFFERBANNER_CAPTION',
                        'type' => 'text',
                        'lang' => true,
                        'label' => $this->l('Image caption'),
                        'desc' => $this->l('Enter image caption'),
                    ),
                    array(
                        'type' => 'select',
                        'label' => $this->l('Display banner side'),
                        'name' => 'TVCMSLEFTSIDEOFFERBANNER_CAPTION_SIDE',
                        'options' => array(
                            'query' => array(
                                array(
                                    'id_option' => 'left',
                                    'name' => 'Left Side'
                                ),
                                array(
                                    'id_option' => 'center',
                                    'name' => 'Center Side'
                                ),
                                array(
                                    'id_option' => 'right',
                                    'name' => 'Right Side'
                                ),
                                array(
                                    'id_option' => 'none',
                                    'name' => 'None'
                                ),
                            ),
                            'id' => 'id_option',
                            'name' => 'name'
                        )
                    ),
                    array(
                        'col' => 6,
                        'name' => 'TVCMSLEFTSIDEOFFERBANNER_LINK',
                        'type' => 'text',
                        'label' => $this->l('Link'),
                        'desc' => $this->l('Enter image link'),
                    ),
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Show in all page'),
                        'name' => 'TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL',
                        'desc' => $this->l('Note: Yes status means show in all pages, No means show in only homepage'),
                        'is_bool' => true,
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->l('Show')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->l('Hide')
                            )
                        )
                    ),
                ),
                
                'submit' => array(
                    'title' => $this->l('Save'),
                ),
            ),
        );
    }
   
    protected function getConfigFormValues()
    {
        $path = _MODULE_DIR_.$this->name."/views/img/";
        $this->context->smarty->assign("path", $path);
        
        $fields = array();

        $languages = Language::getLanguages();
        foreach ($languages as $lang) {
            $a = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_CAPTION', $lang['id_lang']);
            $fields['TVCMSLEFTSIDEOFFERBANNER_CAPTION'][$lang['id_lang']] = $a;
        }

        $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME');
        $fields['TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME'] = $tmp;

        $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR');
        $fields['TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR'] = $tmp;

        $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_CAPTION_SIDE');
        $fields['TVCMSLEFTSIDEOFFERBANNER_CAPTION_SIDE'] = $tmp;
        
        $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_LINK');
        $fields['TVCMSLEFTSIDEOFFERBANNER_LINK'] = $tmp;

        $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL');
        $fields['TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL'] = $tmp;

        return $fields;
    }


    public function hookBackOfficeHeader()
    {
        if (Tools::getValue('module_name') == $this->name) {
            $this->context->controller->addJS($this->_path.'views/js/back.js');
            $this->context->controller->addCSS($this->_path.'views/css/back.css');
        }
    }
   
    public function hookHeader()
    {
        // $this->context->controller->addJS($this->_path.'views/js/front.js');
        // $this->context->controller->addCSS($this->_path.'views/css/front.css');
    }

    public function hookdisplayRightColumn()
    {
        return $this->showResult();
    }

    public function hookdisplayLeftColumn()
    {
        return $this->showResult();
    }

    public function showResult()
    {
        $data = array();

        if (!Cache::isStored('tvcmsleftsideofferbanner_display_home.tpl')) {
            $languages = Language::getLanguages();
            foreach ($languages as $lang) {
                $a = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_CAPTION', $lang['id_lang']);
                $data['TVCMSLEFTSIDEOFFERBANNER_CAPTION'][$lang['id_lang']] = $a;
            }
            $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME');
            $data['TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME'] = $tmp;

            //===============================================
            $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR');
            $data['TVCMSLEFTSIDEOFFERBANNER_IMAGE_NAME_AR'] = $tmp;
            //===============================================

            $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_CAPTION_SIDE');
            $data['TVCMSLEFTSIDEOFFERBANNER_CAPTION_SIDE'] = $tmp;

            $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_LINK');
            $data['TVCMSLEFTSIDEOFFERBANNER_LINK'] = $tmp;

            $tmp = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL');
            $data['TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL'] = $tmp;


            $AllPageShow = Configuration::get('TVCMSLEFTSIDEOFFERBANNER_STATUS_ALL');
            $this->context->smarty->assign('AllPageShow', $AllPageShow);
            $cookie = Context::getContext()->cookie;
            $id_lang = $cookie->id_lang;

            $path = _MODULE_DIR_.$this->name."/views/img/";
            $this->context->smarty->assign("path", $path);

            $this->context->smarty->assign('language_id', $id_lang);
            $this->context->smarty->assign('data', $data);

            $output = $this->display(__FILE__, "views/templates/front/display_home.tpl");
            Cache::store('tvcmsleftsideofferbanner_display_home.tpl', $output);
        }

        return Cache::retrieve('tvcmsleftsideofferbanner_display_home.tpl');
    }
}
