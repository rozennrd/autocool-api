<?php

require_once '../Dao/Param.php';
require_once '../Dao/DBConnex.php';
require_once '../Dao/TypeVehiculeDAO.php';

print(json_encode(TypeVehiculeDAO::getTypeVehicule()));