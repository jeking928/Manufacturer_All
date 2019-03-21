MANUFACTURERS ALL LISTING
Version 1.2
Compatibility: Zen Cart 1.5.6
By Brent Friar (NHRADeuce)
Updated by jeking


***************************************************************
* Always backup your shop and database before making changes. *
***************************************************************

====================
DESCRIPTION
====================
Manufacturers all listing is a simple additional page that displays all of the
manufacturers defined in your Zen Cart. It comes complete with Admin config for
some of the most useful options. The display is tableless, all of the display
is controlled by CSS (w3c validated).

You can access your Manufacturer All Listing at www.yourdomain.com\index.php?main_page=manufacturers_all

=====================
INSTALLATION
=====================

1. Rename \includes\templates\YOUR_TEMPLATE to match your template name.
2. Upload all files to your store's root directory
3. Run the install.sql file in Tools > Install SQL Patches

On some stores you will have to add your table prefix. *** ONLY MAKE THIS CHANGE IF THE SQL FAILS TO WORK THE FIRST TIME ***

   SELECT @gida := configuration_group_id FROM `<TABLE PREFIX HERE>configuration_group` where `configuration_group_title` LIKE 'Layout Settings';
   SELECT @gid := configuration_group_id FROM `<TABLE PREFIX HERE>configuration_group` where `configuration_group_title` LIKE 'Manufacturers All Config';


=====================
TO ADD A LINK
=====================
These edits are optional. They will allow you to add a Manufactures All link to your categories box.

4. Edit \includes\templates\YOUR_TEMPLATE\sideboxes\tpl_categories.php

Find:
    if (SHOW_CATEGORIES_BOX_PRODUCTS_ALL == 'true') {
      $content .= '<a class="category-links" href="' . zen_href_link(FILENAME_PRODUCTS_ALL) . '">' . CATEGORIES_BOX_HEADING_PRODUCTS_ALL . '</a>' . "\n";
    }

Immediately after it, add the following:
    if (SHOW_CATEGORIES_BOX_MANUFACTURERS_ALL == '1') {
      $content .= '<br /><a class="category-links" href="' . zen_href_link(FILENAME_MANUFACTURERS_ALL) . '">' . CATEGORIES_BOX_HEADING_MANUFACTURERS_ALL . '</a>' . "\n";
    }

5. Edit \includes\languages\english.php

Find:
  define('CATEGORIES_BOX_HEADING_PRODUCTS_ALL', 'All Products ...');

Immediately after it, add the following:
  define('CATEGORIES_BOX_HEADING_MANUFACTURERS_ALL', 'All Manufacturers ...');

That's it. You should have a functional manufacturers listing.



=================================================================
This script is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.

Released under the General Public License (see LICENSE.txt)