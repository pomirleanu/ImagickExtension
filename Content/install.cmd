IF NOT EXIST Commands (
  mkdir Commands
)

cd Commands

IF EXIST PHP7.1x64-Imagick (
 rm -rf PHP7.1x64-Imagick
)

:: Download PHP7.1 x64 Imagick Runtime

curl -L -o PHP7.1x64-Imagick.zip http://windows.php.net/downloads/pecl/releases/imagick/3.4.3/php_imagick-3.4.3-7.1-ts-vc14-x64.zip
d:\7zip\7za x PHP7.1x64-Imagick.zip -oPHP7.1x64-Imagick

:: Copy coders dll to imagick folder
cp ../../lib/coders/*.dll PHP7.1x64-Imagick


:: Create php extensions directory
IF EXIST d:\home\site\ext (
 mkdir cd d:\home\site\ext
)

:: Create php ini directory
IF EXIST d:\home\site\ini (
 mkdir cd d:\home\site\ini
)

:: Copy imagick.dll to extension directory
cp PHP7.1x64-Imagick\php_imagick.dll d:\home\site\ext\

:: Create PHP.ini
echo extension=d:\home\site\ext\php_imagick.dll >> d:\home\site\ini\imagick.ini

:: If composer exists create a backup
:: Move ApplicationHost.xdt
IF EXIST d:\home\SiteExtensions\ComposerExtension (
 mv d:\home\SiteExtensions\ComposerExtension\applicationHost.xdt d:\home\SiteExtensions\ComposerExtension\applicationHost-composer-backup-xdt
 cp ../../lib/xdt/applicationHostWithComposer.xdt d:\home\SiteExtensions\ImagickExtension\applicationHost.xdt
)

:: Move ApplicationHost.xdt
IF NOT EXIST d:\home\SiteExtensions\ComposerExtension (
 cp ../../lib/xdt/applicationHost.xdt d:\home\SiteExtensions\ImagickExtension\applicationHost.xdt
)

:: Clean up

cd Commands
rm -rf PHP7.1x64-Imagick.zip
cd ..
