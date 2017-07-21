:: If composer exists re-enable the backup compose extension
IF EXIST d:\home\SiteExtensions\ComposerExtension (
 mv d:\home\SiteExtensions\ComposerExtension\applicationHost-composer-backup-xdt d:\home\SiteExtensions\ComposerExtension\applicationHost.xdt
)
:: Remove imagick ext
IF EXIST d:\home\site\ext(
 rm d:\home\site\ext\imagick.dll
)

:: Remove imagick ini
IF EXIST d:\home\site\ext(
 rm d:\home\site\ini\imagick.ini
)

