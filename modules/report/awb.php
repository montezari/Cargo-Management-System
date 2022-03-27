<?php

$moduleid = "report.awb";

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT inv.*, agen.vnmagent, agen.valamat, DATE_FORMAT(dtglinv,'%d-%m-%Y') AS tglinv FROM tr_invoice inv ";
$sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = inv.ckdagent ";
$sql .= "WHERE inv.cinv = '$_GET[key]' ";
$rs = $conn->Execute($sql);
$vnmagent = $rs->fields["vnmagent"];
$valamat = $rs->fields["valamat"];
$total = $rs->fields["vtotalinv"];

$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->custSQL = $sql;
$content = $admGrdTpl->Show(false);

?>