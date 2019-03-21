DELETE FROM configuration_group WHERE `configuration_group_title` LIKE 'Manufacturers All Config' LIMIT 2;
DELETE FROM configuration WHERE `configuration_description` LIKE 'Manufacturers All Listing:%' LIMIT 7;

INSERT INTO configuration_group VALUES ('', 'Manufacturers All Config', 'Manufacturers All Config', '1', '1');
SELECT @gida := configuration_group_id FROM `configuration_group` where `configuration_group_title` LIKE 'Layout Settings';
SELECT @gid := configuration_group_id FROM `configuration_group` where `configuration_group_title` LIKE 'Manufacturers All Config';
UPDATE configuration_group SET sort_order = @gid WHERE configuration_group_id = @gid;

INSERT INTO configuration VALUES ('', 'Categories Box - Show Manufacturers All Link', 'SHOW_CATEGORIES_BOX_MANUFACTURERS_ALL', '1', 'Manufacturers All Listing: Set this to 1 if you want to show the All Manufacturers link to show in the Categories Box.', @gida, '0', now(), now(), NULL, "zen_cfg_select_option(array('0', '1'),", NULL);
INSERT INTO configuration VALUES ('', 'Display Empty Manufacturers', 'MANUFACTURERS_ALL_EMPTY_SHOW', '0', 'Manufacturers All Listing: Set this to 1 if you want manufacturers with no products to show on the list.', @gid, '7', now(), now(), NULL, "zen_cfg_select_option(array('0', '1'),", NULL);
INSERT INTO configuration VALUES ('', 'Display Manufacturer Image', 'MANUFACTURERS_ALL_IMAGE_SHOW', '1', 'Manufacturers All Listing: Set this to 1 if you want the manufacturers logo to appear with the listing.', @gid, '7', now(), now(), NULL, "zen_cfg_select_option(array('0', '1'),", NULL);
INSERT INTO configuration VALUES ('', 'Display Manufacturer URL', 'MANUFACTURERS_ALL_URL_SHOW', '1', 'Manufacturers All Listing: Set this to 1 if you want the manufacturers URL to appear with the listing.', @gid, '7', now(), now(), NULL, "zen_cfg_select_option(array('0', '1'),", NULL);
INSERT INTO configuration VALUES ('', 'Manufacturers Per Row', 'MANUFACTURERS_ALL_COLUMNS', '4', 'Manufacturers All Listing: Set the number of manufacturers per row to display.<br>(default 4)', @gid, '7', now(), now(), NULL, NULL, NULL);
INSERT INTO configuration VALUES ('', 'Manufacturer Image Width', 'MANUFACTURERS_ALL_WIDTH', '100px', 'Manufacturers All Listing: Set the maximum width of the manufacturers image.<br>(default 100px)', @gid, '7', now(), now(), NULL, NULL, NULL);
INSERT INTO configuration VALUES ('', 'Manufacturer Image Height', 'MANUFACTURERS_ALL_HEIGHT', '100px', 'Manufacturers All Listing: Set the maximum height of the manufacturers image<br>(default 100px)', @gid, '7', now(), now(), NULL, NULL, NULL);


/*
Admin page (Zen-cart 1.5.0)
*/
INSERT INTO `admin_pages` (`page_key` ,`language_key` ,`main_page` ,`page_params` ,`menu_key` ,`display_on_menu` ,`sort_order`)VALUES 
('configManufacturersList', 'BOX_CONFIGURATION_MANUFACTURERS_LIST', 'FILENAME_CONFIGURATION', CONCAT('gID=',@gid), 'configuration', 'Y', @gid);
