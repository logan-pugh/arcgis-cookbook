name             'arcgis-enterprise'
maintainer       'Esri'
maintainer_email 'contracts@esri.com'
license          'Apache 2.0'
description      'Installs and configures ArcGIS Enterprise'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.3.0'
chef_version     '>= 12.6', '< 15.0' if defined? chef_version

depends          'arcgis-repository'
depends          'hostsfile'
depends          'limits'
depends          'authbind'
depends          'iptables'
depends          'windows'
depends          'windows_firewall'
depends          'ms_dotnet'
depends          'nfs'
depends          'java_properties'

supports         'windows'
supports         'ubuntu'
supports         'redhat'

recipe 'arcgis-enterprise::clean', 'Deletes local directories created by ArcGIS software'
recipe 'arcgis-enterprise::datastore', 'Installs and configures ArcGIS Data Store on primary machine'
recipe 'arcgis-enterprise::datastore_standby', 'Installs and configures ArcGIS Data Store on standby machine'
recipe 'arcgis-enterprise::disable_geoanalytics', 'Resets the big data analytics configuration on Portal for ArcGIS'
recipe 'arcgis-enterprise::disable_rasteranalytics', 'Resets raster analytics configuration on Portal for ArcGIS'
recipe 'arcgis-enterprise::egdb', 'Registers GeoDatabases with server'
recipe 'arcgis-enterprise::enable_geoanalytics', 'Configures the ArcGIS Portal to perform big data analytics'
recipe 'arcgis-enterprise::enable_rasteranalytics', 'Configures the ArcGIS Portal to raster analytics'
recipe 'arcgis-enterprise::federation', 'Federates ArcGIS Server with Portal for ArcGIS'
recipe 'arcgis-enterprise::fileserver', 'Configures shared directories on file server machine'
recipe 'arcgis-enterprise::hosts', 'Creates entries in /etc/hosts file for the specified hostname to IP address map'
recipe 'arcgis-enterprise::iptables', 'Configures ports for products'
recipe 'arcgis-enterprise::ip-install', 'Installs language packs for ArcGIS Enterprise software'
recipe 'arcgis-enterprise::patches', 'Installs hot fixes and patches for ArcGIS Enterprise software'
recipe 'arcgis-enterprise::portal', 'Installs and configures Portal for ArcGIS on primary machine'
recipe 'arcgis-enterprise::portal_stanby', 'Installs and configures Portal for ArcGIS on standby machine'
recipe 'arcgis-enterprise::portal_wa', 'Installs Web Adaptor and configures it with Portal for ArcGIS'
recipe 'arcgis-enterprise::post_install', 'Executes custom post-installation script if it exists.'
recipe 'arcgis-enterprise::server', 'Installs and configures ArcGIS Server'
recipe 'arcgis-enterprise::server_node', 'Installs ArcGIS Server on the machine and joins an existing site'
recipe 'arcgis-enterprise::server_security', 'Configures ArcGIS Server identity stores and assigns privileges to roles.'
recipe 'arcgis-enterprise::server_wa', 'Installs Web Adaptor and configures it with ArcGIS Server'
recipe 'arcgis-enterprise::services', 'Publishes services to ArcGIS Server'
recipe 'arcgis-enterprise::stop_machine', 'Stops server machine in the ArcGIS Server site'
recipe 'arcgis-enterprise::system', 'System requirements'
recipe 'arcgis-enterprise::enterprise_installed', 'Installs ArcGIS Server, Data Store, Portal, and Web Adaptors for Server and Portals'
recipe 'arcgis-enterprise::enterprise_uninstalled', 'Uninstalls all ArcGIS software of the specified version'
recipe 'arcgis-enterprise::enterprise_validate', 'Checks if ArcGIS Server setups and authorization files exist'
recipe 'arcgis-enterprise::unregister_machine', 'Unregisters server machine from the ArcGIS Server site'
recipe 'arcgis-enterprise::unregister_stopped_machines', 'Unregisters all unavailable server machines in \'default\' cluster from the ArcGIS Server site'

issues_url 'https://github.com/Esri/arcgis-cookbook/issues' if respond_to?(:issues_url)
source_url 'https://github.com/Esri/arcgis-cookbook' if respond_to?(:source_url)
