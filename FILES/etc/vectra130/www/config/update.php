<?php
session_start();
$hostname = $_SESSION['hostname'];
$SYSTEMTYP = $_SESSION['SYSTEMTYP'];
$rand = $_SESSION['rand'];
$ACTION = $_GET['action'];
$UPDATEFILE = $_GET['UPDATEFILE'];
if (!isset($hostname)) {
	$hostname = $_GET['hostname'];
}
if (!isset($SYSTEMTYP)) {
        $SYSTEMTYP = $_GET['SYSTEMTYP'];
}

if( "$ACTION" == "exec" ) {
    if( $SYSTEMTYP == "Server" )
	exec ('/bin/bash /etc/vectra130/www/config/scripts/updateStreamingServer.sh update', $result);
    else
	exec ('/bin/bash /etc/vectra130/www/config/scripts/updateStreamingClient.sh update', $result);
    echo "<div class='panel' id='update_exec' title='System Update' selected='true'>";
    if( $result[0] == "OK" )
    {
	echo "<fieldset><p></br><b>Systemupdate wird durchgef&uuml;hrt. System nicht ausschalten.</br>Der Download kann einige Minuten dauern.</br>Nach dem Download werden Statusmeldungen auf dem Fernseher ausgegeben.</br>Das System startet nach dem Update automatisch neu.</b></br></br></p></fieldset>";
	exec ('/bin/bash /etc/vectra130/update/prepare_update.sh | tee -a /etc/vectra130/update.log > /dev/tty1 &2>/dev/tty1 &');
    } else
    {
	echo "<fieldset><p><b>Ein Problem ist aufgetreten. Das Update konnte nicht herunter geladen werden!!</b></p></fieldset>";
    }
}
else {

// update files laden
if( $SYSTEMTYP == "Server" )
{
    exec('/etc/vectra130/www/config/scripts/updateStreamingServer.sh check', $updateCheck);
    exec('/etc/vectra130/www/config/scripts/updateStreamingServer.sh date', $updateDate);
    exec('/etc/vectra130/www/config/scripts/updateStreamingServer.sh size', $updateSize);
} else
{
    exec('/etc/vectra130/www/config/scripts/updateStreamingClient.sh check', $updateCheck);
    exec('/etc/vectra130/www/config/scripts/updateStreamingClient.sh date', $updateDate);
    exec('/etc/vectra130/www/config/scripts/updateStreamingClient.sh size', $updateSize);
}
?>
<div class='panel' id='update' title='Update - <?php echo $hostname; ?>' selected='true'>
<?php
echo "<form method='post' action='update.php?hostname=".$hostname."&SYSTEMTYP=".$SYSTEMTYP."&action=exec' enctype='multipart/form-data'>";
if( $updateCheck[0] != "" )
{
    echo '<p><b>Neues Online Update gefunden.</br></br>Aktuelle Version:&nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>v'.exec('cat /etc/vectra130/VERSION').'</font></br>Update Version:&nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>v'.$updateCheck[0].'</font></br>Update Gr&ouml;&szlig;e:&nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>'.$updateSize[0].'</font></br>Update Datum:&nbsp;&nbsp;&nbsp;&nbsp;<font color=blue>'.$updateDate[0].'</font></br></br></p>';
    echo '<p>Das Update installiert im Hintergrund.</br>Je nach Gr&ouml;&szlig;e und Internetverbindung kann dies einige Minuten dauern.</br></br>Alle Frontends (VDR, Kodi) werden beendet. Nach dem Update wird das System automatisch neu gestartet.</br></br></br></b></p>';
    echo "<a href='#' class='whiteButton' type='submit'>Herunterladen und Installieren</a><div class='spinner'></div>";
} else
{
    echo '<fieldset><p>Kein Online Update gefunden</br>Das System ist auf dem aktuellen Stand</p></fieldset>';
}
?>

</form>
<?php
}
?>

</div>
