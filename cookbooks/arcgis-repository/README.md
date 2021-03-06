arcgis-repository cookbook
===============

arcgis-repository cookbook downloads ArcGIS software setup archives from remote to local repositories.

Requirements
------------

### Platforms

* Windows 7
* Windows 8 (8.1)
* Windows 10
* Windows Server 2008 (R2)
* Windows Server 2012 (R2)
* Windows Server 2016
* Ubuntu 14.04, 16.04
* Rhel 6.5, 7.0

### Dependencies

The following cookbooks are required:

* aws

Attributes
----------

* `node['arcgis']['repository']['setups']` = Path to folder with ArcGIS software setups. Default path is `%USERPROFILE%\Documents` on Windows and `/opt/arcgis` on Linux.
* `node['arcgis']['repository']['archives']` = Local or network ArcGIS software repository path. The default path on windows is `%USERPROFILE%\\Software\\Esri`, on Linux `/opt/software/esri`.
* `node['arcgis']['repository']['local_archives']` = Local ArcGIS software repository path. The default path on windows is `%USERPROFILE%\\Software\\Esri`, on Linux `/opt/software/esri`.
* `node['arcgis']['repository']['patches']` = Path to folder with hot fixes and patches for ArcGIS Enterprise software. The default path on Windows is `%USERPROFILE%\Software\Esri\Patches`,   on Linux is `/opt/software/esri/patches`.
* `node['arcgis']['repository']['server']['url']` = Remote ArcGIS software repository URL. The Default URL is `https://downloads.arcgis.com/dms/rest/download/secured`.
* `node['arcgis']['repository']['server']['key']` = Remote ArcGIS software repository key.
* `node['arcgis']['repository']['server']['s3bucket']` = Remote ArcGIS software repository S3 bucket name.
* `node['arcgis']['repository']['server']['aws_access_key']` = AWS access key ID.
* `node['arcgis']['repository']['server']['aws_secret_access_key']` = AWS secret access key.
* `node['arcgis']['repository']['files']` = file names mapped to SHA256 checksum and the remote path subfolder attributes. Default value is `nil`.

Recipes
-------

### arcgis-repository::default

Downloads files from remote ArcGIS software repository to local repository specified by `node['arcgis']['repository']['local_archives']` attribute.

### arcgis-repository::s3files

Downloads files from ArcGIS software repository in S3 to local repository specified by `node['arcgis']['repository']['local_archives']` attribute.

Examples
--------

arcgis-repository::default recipe attributes use example. 

```JSON
{
   "arcgis":{
      "repository":{
         "archives":"C:\\Temp\\Software\\Esri",
         "local_archives":"C:\\Temp\\Software\\Esri",
         "server":{
            "url":"https://downloads.arcgis.com/dms/rest/download/secured",
            "key":"<arcgis_online_token>"
         },
         "files":{
            "ArcGIS_DataStore_10124.exe":{
               "subfolder":"software/arcgis_daily/10.7"
            },
            "ArcGIS_Server_10124.exe":{
               "subfolder":"software/arcgis_daily/10.7",
               "checksum":"7CDD2B78BA2C49D4C81882E6211EDCB1BAFCD8BBE64BDF89C2D538BF48F3CDDD"
            }
         }
      }
   },
   "run_list":[
      "recipe[arcgis-repository]"
   ]
}
```

arcgis-repository::s3files recipe use example.

```JSON
{
   "arcgis":{
      "repository":{
         "archives":"/opt/software/esri",
         "local_archives":"/opt/software/esri",
         "server":{
            "s3bucket":"arcgisstore107-us-east-1",
            "aws_access_key":"<access_key>",
            "aws_secret_access_key":"<secret_key>"
         },
         "files":{
            "ArcGIS_DataStore_Linux_107_167719.tar.gz":{
               "subfolder":"10450/setups",
               "checksum":"A8DBE53A19838120ED99D352654174B37B31163E173AD0D26B47A15872E4245C"
            },
            "ArcGIS_Server_Linux_107_167707.tar.gz":{
               "subfolder":"10450/setups",
               "checksum":"350B985F8CF900A27C0043561CFA092930A1CCA2352A1DECABA4DD378ECA1492"
            }
         }
      }
   },
   "run_list":[
      "recipe[arcgis-repository::s3files]"
   ]
}
```
