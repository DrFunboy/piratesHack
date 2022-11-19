<?php
if (!empty($data['shopitem']) && empty($data['price'])) {
    $si = $modx->getObject('idShopItem', $data['shopitem']);
    if (!empty($si)) $data['price'] = $si->get('price');
}

if (!empty($data['price']) && !empty($data['amount'])) {
    $data['total'] = $data['price'] * $data['amount'];
}

if ($oper == 'add') {
    if (empty($data['status'])) $data['status'] = getClubConfig('idOrderItems_main');
}