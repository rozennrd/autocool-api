<?php

require_once '../Dao/Param.php';
require_once '../Dao/DBConnex.php';
require_once '../Dao/StationsDAO.php';

print(json_encode(StationsDAO::getStationsAndTowns()));